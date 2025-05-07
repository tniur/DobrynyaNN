import Foundation

public struct UploadProfileAvatarResult: Sendable {
    public let avatarUrl: String

    public init(avatarUrl: String) {
        self.avatarUrl = avatarUrl
    }
}
