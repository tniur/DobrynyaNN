import Foundation

public struct LoginDTO: Encodable, Sendable {
    public let login: String
    public let password: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
        case password
    }
}
