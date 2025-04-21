import Foundation

public enum NetworkError: Error, LocalizedError {
    case unauthorized
    case notFound
    case server(ServerError)
    case unacceptableStatusCode(Int)
    case decodingError
    case unknown

    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return NSLocalizedString("unauthorized", comment: "")
        case .notFound:
            return NSLocalizedString("notFound", comment: "")
        case .server(let error):
            return error.detail
        case .unacceptableStatusCode(let code):
            return "\(NSLocalizedString("unacceptableStatusCode", comment: "")): \(code)"
        case .decodingError:
            return NSLocalizedString("decodingError", comment: "")
        case .unknown:
            return NSLocalizedString("unknown", comment: "")
        }
    }
}

public struct ServerError: Decodable, Error {
    let detail: String
}
