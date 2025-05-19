import Foundation

public struct DBRRecoverRequestCodeDTO: Encodable, Sendable {
    public let login: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
    }
}
