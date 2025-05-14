import Foundation

public struct DBRUploadProfileAvatarDTO: Codable, Sendable, DBRValidatableResponse {
    public let success: Bool
    public let avatarPath: String
    public let message: String

    private enum CodingKeys: String, CodingKey {
        case success, message
        case avatarPath = "avatar_path"
    }
}
