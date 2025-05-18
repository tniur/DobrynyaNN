import Foundation

public struct DBRRegisterRequestCodeResult: Sendable {
    public let phone: String

    public init(phone: String) {
        self.phone = phone
    }
}
