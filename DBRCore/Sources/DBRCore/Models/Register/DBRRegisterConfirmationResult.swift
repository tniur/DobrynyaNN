import Foundation

public struct DBRRegisterConfirmationResult: Sendable {
    public let accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
