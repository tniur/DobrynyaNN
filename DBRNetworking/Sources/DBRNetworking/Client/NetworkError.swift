import Foundation

public enum NetworkError: Error {
    case unauthorized
    case notFound
    case errorResponse(ErrorResponse)
    case badRequest(ErrorResponse)
    case unexpectedResponse(Int)

    case decodingError
    case invalidURL
    case invalidServerResponse

    case noConnection
    case timeout

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
            case .notConnectedToInternet, .networkConnectionLost:
                return .noConnection
            case .timedOut:
                return .timeout
            default:
                return .unknown(urlError)
            }
        }

        return .unknown(error)
    }
}

public struct ErrorResponse: Decodable, Error {
    let detail: String
}
