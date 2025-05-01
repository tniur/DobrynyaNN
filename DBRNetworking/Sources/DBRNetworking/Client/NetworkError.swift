import Foundation

public enum NetworkError: Error {
    case unauthorized
    case notFound
    case server(ErrorResponse)
    case unacceptableStatusCode(Int)
    case decodingError
    case unknown
    case badURL
    case badServerResponse
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
        case .badServerResponse:
            return NSLocalizedString("badServerResponse", bundle: Bundle.module, comment: "")
        case .unacceptableStatusCode(let code):
            return "\(NSLocalizedString("unacceptableStatusCode", bundle: Bundle.module, comment: "")): \(code)"
        case .badURL:
            return NSLocalizedString("badURL", bundle: Bundle.module, comment: "")
        case .server(let error):
            return error.detail
        }
    }
}

public struct ErrorResponse: Decodable, Error {
    let detail: String
}
