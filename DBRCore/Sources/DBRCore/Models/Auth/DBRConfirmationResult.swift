import Foundation

public struct DBRConfirmationResult: Sendable {
    public let accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
