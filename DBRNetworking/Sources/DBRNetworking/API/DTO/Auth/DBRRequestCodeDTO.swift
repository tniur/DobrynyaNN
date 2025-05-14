import Foundation

public struct DBRRequestCodeDTO: Codable, Sendable {
    public let message: String
    public let phoneMasked: String

    private enum CodingKeys: String, CodingKey {
        case message
        case phoneMasked = "phone_masked"
    }
}
