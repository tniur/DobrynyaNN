import Foundation

public struct DBRRecoverRequestCodeResult: Sendable {
    public let phoneMasked: String

    public init(phoneMasked: String) {
        self.phoneMasked = phoneMasked
    }
}
