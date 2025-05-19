import Foundation

// MARK: - Client

public actor DBRNetworkClient: DBRNetworkClientProtocol {
    private let session: URLSession
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let retryStrategy: DBRRetryStrategy

    public init(retryStrategy: DBRRetryStrategy = .init()) {
        self.retryStrategy = retryStrategy
        self.session = URLSession(configuration: .default)
        decoder.keyDecodingStrategy = .useDefaultKeys
    }
}

// MARK: - Send Methods

extension DBRNetworkClient {
    public func send<T: Decodable & Sendable>(_ request: DBRRequest<T>) async throws -> T {
        try await send(request, { data in
            try await self.decode(T.self, from: data)
        })
    }

    public func send(_ request: DBRRequest<Void>) async throws {
        try await send(request) { _ in () }
    }

    private func send<T: Sendable>(
        _ request: DBRRequest<T>,
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
}

// MARK: - Validated Send

extension DBRNetworkClient {
    public func sendValidated<T: Decodable & Sendable & DBRValidatableResponse>(
        _ request: DBRRequest<T>
    ) async throws -> T {
        let response = try await send(request)

        guard response.success else {
            throw DBRNetworkError.businessLogicError(response.message)
        }

        return response
    }
}

// MARK: - Supported

extension DBRNetworkClient {
    private func decode<T: Decodable>(_ type: T.Type, from data: Data) async throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw DBRNetworkError.decodingError
        }
    }

    private func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw DBRNetworkError.invalidServerResponse
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            switch httpResponse.statusCode {
            case 400:
                if let errorResponse = try? decoder.decode(DBRErrorResponse.self, from: data) {
                    throw DBRNetworkError.badRequest(errorResponse)
                } else {
                    throw DBRNetworkError.badRequestCode(httpResponse.statusCode)
                }
            case 401:
                throw DBRNetworkError.unauthorized
            case 404:
                throw DBRNetworkError.notFound
            case 409:
                throw DBRNetworkError.conflict
            case 503:
                throw DBRNetworkError.serviceUnavailable
            default:
                if let errorResponse = try? decoder.decode(DBRErrorResponse.self, from: data) {
                    throw DBRNetworkError.errorResponse(errorResponse)
                } else {
                    throw DBRNetworkError.unexpectedResponseBody(httpResponse.statusCode)
                }
            }
        }
    }

    private func makeURLRequest<T>(for request: DBRRequest<T>) async throws -> URLRequest {
        var components = URLComponents(
            url: (request.url).appendingPathComponent(request.path),
            resolvingAgainstBaseURL: false
        )

        components?.queryItems = request.query?.map { URLQueryItem(name: $0.0, value: $0.1) }

        guard let finalURL = components?.url else {
            throw DBRNetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue

        if let body = request.body {
            urlRequest.httpBody = try encoder.encode(DBRAnyEncodable(value: body))
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

// MARK: - Retrying

extension DBRNetworkClient {
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
                    throw DBRNetworkError.from(error)
                }

                let wait = delay(attempt)
                try? await Task.sleep(nanoseconds: UInt64(wait * 1_000_000_000))
            }
        }

        throw DBRNetworkError.unknown()
    }

    private func shouldRetry(for error: Error) -> Bool {
        switch DBRNetworkError.from(error) {
        case .connectionTimeout, .noConnected, .connectionLost:
            return true
        case .serviceUnavailable:
            return true
        case .unexpectedResponseBody(let code):
            return (500...599).contains(code)
        default:
            return false
        }
    }
}
