import Foundation
import DBRCore

public actor NetworkClient: NetworkProtocol {
    private let baseURL: URL
    private let session: URLSession
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let retryStrategy: RetryStrategy

    public init(baseURL: URL, retryStrategy: RetryStrategy = .init()) {
        self.baseURL = baseURL
        self.retryStrategy = retryStrategy
        self.session = URLSession(configuration: .default)
        decoder.keyDecodingStrategy = .useDefaultKeys
    }
}

extension NetworkClient {
    public func send<T: Decodable & Sendable>(_ request: Request<T>) async throws -> T {
        try await send(request, { data in
            try await self.decode(T.self, from: data)
        })
    }

    public func send(_ request: Request<Void>) async throws {
        try await send(request) { _ in () }
    }

    private func send<T: Sendable>(
        _ request: Request<T>,
        _ decode: @escaping (Data) async throws -> T
    ) async throws -> T {
        try await retrying(
            maxAttempts: retryStrategy.maxAttempts,
            delay: retryStrategy.delay(for:),
            shouldRetry: shouldRetry(for:)
        ) {
            let urlRequest = try await self.makeURLRequest(for: request)
            let (data, response) = try await self.send(urlRequest)
            try self.validate(response: response, data: data)
            return try await decode(data)
        }
    }

    private func send(_ request: URLRequest) async throws -> (Data, URLResponse) {
        try await session.data(for: request, delegate: nil)
    }

    private func decode<T: Decodable>(_ type: T.Type, from data: Data) async throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }

    private func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidServerResponse
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            switch httpResponse.statusCode {
            case 401:
                throw NetworkError.unauthorized
            case 404:
                throw NetworkError.notFound
            default:
                if let errorResponse = try? decoder.decode(ErrorResponse.self, from: data) {
                    throw NetworkError.errorResponse(errorResponse)
                } else {
                    throw NetworkError.unexpectedResponse(httpResponse.statusCode)
                }
            }
        }
    }

    private func retrying<T: Sendable>(
        maxAttempts: Int,
        delay: (Int) -> TimeInterval,
        shouldRetry: @escaping (Error) -> Bool,
        operation: @escaping () async throws -> T
    ) async throws -> T {
        for attempt in 1...maxAttempts {
            do {
                return try await operation()
            } catch {
                let isLastAttempt = attempt == maxAttempts
                if isLastAttempt || !shouldRetry(error) {
                    throw NetworkError.from(error)
                }

                let wait = delay(attempt)
                try? await Task.sleep(nanoseconds: UInt64(wait * 1_000_000_000))
            }
        }

        throw NetworkError.unknown()
    }
}

extension NetworkClient {
    private func makeURLRequest<T>(for request: Request<T>) async throws -> URLRequest {
        var components = URLComponents(
            url: baseURL.appendingPathComponent(request.path),
            resolvingAgainstBaseURL: false
        )

        components?.queryItems = request.query?.map { URLQueryItem(name: $0.0, value: $0.1) }

        guard let finalURL = components?.url else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue

        if let body = request.body {
            urlRequest.httpBody = try encoder.encode(AnyEncodable(value: body))
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        if let headers = request.headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
}

extension NetworkClient {
    private func shouldRetry(for error: Error) -> Bool {
        switch NetworkError.from(error) {
        case .timeout, .noConnection:
            return true
        case .unexpectedResponse(let code):
            return (500...599).contains(code)
        default:
            return false
        }
    }
}
