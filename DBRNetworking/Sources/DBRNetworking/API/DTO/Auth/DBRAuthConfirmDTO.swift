import Foundation

public struct DBRAuthConfirmDTO: Encodable, Sendable {
    public let login: String
    public let code: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
        case code
    }
}
