import Foundation

public enum DBRNetworkError: Error {
    case invalidURL
    case invalidServerResponse

    case noConnected
    case connectionLost
    case connectionTimeout

    case serviceUnavailable

    case notFound
    case unauthorized
    case conflict
    case badRequest(DBRErrorResponse)
    case badRequestCode(Int)
    case errorResponse(DBRErrorResponse)
    case unexpectedResponseBody(Int)

    case decodingError

    case businessLogicError(String)

    case unknown(Error? = nil)
}

extension DBRNetworkError {
    public static func from(_ error: Error) -> DBRNetworkError {
        if let networkError = error as? DBRNetworkError {
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
