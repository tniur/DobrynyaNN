import Foundation

public struct DBRAuthLoginDTO: Encodable, Sendable {
    public let login: String
    public let password: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
        case password
    }
}
