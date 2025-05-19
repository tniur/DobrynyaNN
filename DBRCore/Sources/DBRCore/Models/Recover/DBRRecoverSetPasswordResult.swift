import Foundation

public struct DBRRecoverSetPasswordResult: Sendable {
    public let accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
