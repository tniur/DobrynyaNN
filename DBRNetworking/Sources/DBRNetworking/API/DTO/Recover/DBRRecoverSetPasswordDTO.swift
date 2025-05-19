import Foundation

public struct DBRRecoverSetPasswordDTO: Codable, Sendable {
    public let login: String
    public let newPassword: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
        case newPassword = "new_password"
    }
}
