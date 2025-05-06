import Foundation

public struct Clinic: Sendable, Identifiable {
    public let title: String
    public let doctorName: String
    public let id: Int
    public let realAddress: String
    public let phone: String

    public init(title: String, doctorName: String, id: Int, realAddress: String, phone: String) {
        self.title = title
        self.doctorName = doctorName
        self.id = id
        self.realAddress = realAddress
        self.phone = phone
    }
}
