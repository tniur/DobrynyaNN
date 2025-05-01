import Foundation

public enum NetworkError: Error {
    case unauthorized
    case notFound
    case errorResponse(ErrorResponse)
    case unexpectedResponse(Int)
    case decodingError
    case unknown
    case invalidURL
    case invalidServerResponse
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return NSLocalizedString("unauthorized", bundle: Bundle.module, comment: "")
        case .notFound:
            return NSLocalizedString("notFound", bundle: Bundle.module, comment: "")
        case .decodingError:
            return NSLocalizedString("decodingError", bundle: Bundle.module, comment: "")
        case .unknown:
            return NSLocalizedString("unknown", bundle: Bundle.module, comment: "")
        case .invalidServerResponse:
            return NSLocalizedString("invalidServerResponse", bundle: Bundle.module, comment: "")
        case .unexpectedResponse(let code):
            return "\(NSLocalizedString("unexpectedResponse", bundle: Bundle.module, comment: "")): \(code)"
        case .invalidURL:
            return NSLocalizedString("invalidURL", bundle: Bundle.module, comment: "")
        case .errorResponse(let error):
            return error.detail
        }
    }
}

public struct ErrorResponse: Decodable, Error {
    let detail: String
}
