import Foundation

public struct DBRUploadProfileAvatarResult: Sendable {
    public let avatarUrl: String

    public init(avatarUrl: String) {
        self.avatarUrl = avatarUrl
    }
}
