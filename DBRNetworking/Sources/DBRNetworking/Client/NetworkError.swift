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

    case unknown(Error? = nil)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest(let error):
            let message = NSLocalizedString(
                "badRequest",
                bundle: Bundle.module,
                comment: "Bad request"
            )

            return "\(message): \(error.detail)"
        case .unauthorized:
            return NSLocalizedString("unauthorized",
                                     bundle: Bundle.module,
                                     comment: "Unauthorized access")
        case .notFound:
            return NSLocalizedString("notFound",
                                     bundle: Bundle.module,
                                     comment: "Resource not found")
        case .decodingError:
            return NSLocalizedString("decodingError",
                                     bundle: Bundle.module,
                                     comment: "Failed to decode response")
        case .invalidServerResponse:
            return NSLocalizedString("invalidServerResponse",
                                     bundle: Bundle.module,
                                     comment: "Invalid response from server")
        case .invalidURL:
            return NSLocalizedString("invalidURL",
                                     bundle: Bundle.module,
                                     comment: "Invalid URL")
        case .noConnection:
            return NSLocalizedString("noConnection",
                                     bundle: .module,
                                     comment: "No internet connection")
        case .timeout:
            return NSLocalizedString("timeout",
                                     bundle: .module,
                                     comment: "Request timed out")
        case .unexpectedResponse(let code):
            let message = NSLocalizedString(
                "unexpectedResponse",
                bundle: Bundle.module,
                comment: "Unexpected response"
            )

            return "\(message): \(code)"
        case .errorResponse(let error):
            return error.detail
        case .unknown(let underlying):
            return underlying?.localizedDescription ??
            NSLocalizedString("unknown", bundle: Bundle.module, comment: "Unknown error")
        }
    }
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
