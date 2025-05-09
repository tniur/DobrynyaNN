import Foundation

public struct ErrorResponse: Decodable, Error {
    public let detail: String
}
