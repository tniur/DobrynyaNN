import Foundation

public struct DBRSlotDateInterval: Sendable, Equatable {
    public let start: String
    public let end: String

    public init(start: String, end: String) {
        self.start = start
        self.end = end
    }
}
