import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse

    case noConnected
    case connectionLost
    case connectionTimeout

    case serviceUnavailable

    case notFound
    case unauthorized
    case badRequest(ErrorResponse)
    case badRequestCode(Int)
    case errorResponse(ErrorResponse)
    case unexpectedResponseBody(Int)

    case decodingError

    case businessLogicError(String)

    case unknown(Error? = nil)
}

extension NetworkError {
    public static func from(_ error: Error) -> NetworkError {
        if let networkError = error as? NetworkError {
            return networkError
        }

        if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                return .noConnected
            case .networkConnectionLost:
                return .connectionLost
            case .timedOut:
                return .connectionTimeout
            default:
                return .unknown(urlError)
            }
        }

        return .unknown(error)
    }
}
