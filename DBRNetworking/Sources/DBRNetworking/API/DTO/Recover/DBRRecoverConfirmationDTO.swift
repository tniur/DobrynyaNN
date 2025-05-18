import Foundation

public struct DBRRecoverConfirmationDTO: Encodable, Sendable {
    public let login: String
    public let code: String

    private enum CodingKeys: String, CodingKey {
        case login = "email"
        case code
    }
}
