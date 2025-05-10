import Foundation

public struct RequestCodeResult: Sendable {
    public let phoneMasked: String

    public init(phoneMasked: String) {
        self.phoneMasked = phoneMasked
    }
}
