import Foundation

public struct DBRAuthConfirmationResult: Sendable {
    public let accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
