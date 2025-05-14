import Foundation

public struct DBRErrorResponse: Decodable, Error {
    public let detail: String
}
