import Foundation

public actor NetworkClient {
    private let baseURL: URL
    private let session: URLSession
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    public init(baseURL: URL) {
        self.baseURL = baseURL
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

    public func send(_ request: Request<Void>) async throws -> Void {
        try await send(request) { _ in () }
    }

    private func send<T: Sendable>(
        _ request: Request<T>,
        _ decode: @escaping (Data) async throws -> T) async throws -> T {
            let urlRequest = try await makeURLRequest(for: request)
            let (data, response) = try await send(urlRequest)
            try validate(response: response, data: data)
            return try await decode(data)
    }

    private func send(_ request: URLRequest) async throws -> (Data, URLResponse) {
        try await session.data(for: request, delegate: nil)
    }

    private func decode<T: Decodable>(_ type: T.Type, from data: Data) async throws -> T {
        return try decoder.decode(T.self, from: data)
    }

    private func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            if let errorResponse = try? decoder.decode(ErrorResponse.self, from: data) {
                switch httpResponse.statusCode {
                case 401:
                    throw NetworkError.unauthorized
                case 404:
                    throw NetworkError.notFound
                default:
                    throw NetworkError.server(errorResponse)
                }
            } else {
                throw NetworkError.unacceptableStatusCode(httpResponse.statusCode)
            }
        }
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
            throw URLError(.badURL)
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
