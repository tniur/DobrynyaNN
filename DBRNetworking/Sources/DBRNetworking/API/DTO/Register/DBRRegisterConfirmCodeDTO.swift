import Foundation

public struct DBRRegisterConfirmCodeDTO: Encodable, Sendable {
    public let login: String
    public let password: String
    public let mobile: String
    public let code: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
        case code, password, mobile
    }
}
