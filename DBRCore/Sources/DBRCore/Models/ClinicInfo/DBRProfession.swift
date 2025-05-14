import Foundation

public struct DBRProfession: Sendable, Identifiable {
    public let id: Int
    public let name: String
    public let doctorName: String

    public init(id: Int, name: String, doctorName: String) {
        self.id = id
        self.name = name
        self.doctorName = doctorName
    }
}
