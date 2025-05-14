import Foundation

public struct DBRRequestCodeResult: Sendable {
    public let phoneMasked: String

    public init(phoneMasked: String) {
        self.phoneMasked = phoneMasked
    }
}
