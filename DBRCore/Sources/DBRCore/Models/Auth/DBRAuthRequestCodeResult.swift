import Foundation

public struct DBRAuthRequestCodeResult: Sendable {
    public let phoneMasked: String

    public init(phoneMasked: String) {
        self.phoneMasked = phoneMasked
    }
}
