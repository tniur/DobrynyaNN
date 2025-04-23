import Foundation

public enum NetworkError: Error, LocalizedError {
    case unauthorized
    case notFound
    case server(ErrorResponse)
    case unacceptableStatusCode(Int)
    case decodingError
    case unknown
    case badURL
    case badServerResponse

    public var errorDescription: String {
        switch self {
        case .unauthorized:
            return Localized.string("unauthorized")
        case .notFound:
            return Localized.string("notFound")
        case .decodingError:
            return Localized.string("decodingError")
        case .unknown:
            return Localized.string("unknown")
        case .badServerResponse:
            return Localized.string("badServerResponse")
        case .unacceptableStatusCode(let code):
            return "\(Localized.string("unacceptableStatusCode")): \(code)"
        case .badURL:
            return Localized.string("badURL")
        case .server(let error):
            return error.detail
        }
    }
}

public struct ErrorResponse: Decodable, Error {
    let detail: String
}
