import Foundation

public struct UploadProfileAvatarDTO: Codable, Sendable {
    public let success: Bool
    public let avatarPath: String
    public let message: String

    private enum CodingKeys: String, CodingKey {
        case success, message
        case avatarPath = "avatar_path"
    }
}
