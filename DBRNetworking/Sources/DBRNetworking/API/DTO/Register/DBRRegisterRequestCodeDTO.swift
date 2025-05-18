import Foundation

public struct DBRRegisterRequestCodeDTO: Encodable, Sendable {
    public let login: String
    public let mobile: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
        case mobile
    }
}
