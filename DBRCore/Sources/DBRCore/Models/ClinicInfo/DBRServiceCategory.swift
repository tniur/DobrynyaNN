import Foundation

public struct DBRServiceCategory: Sendable, Identifiable {
    public let id: Int
    public let title: String

    public init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
