import Foundation

public struct DBRClinic: Sendable, Identifiable {
    public let id: Int
    public let title: String
    public let doctorName: String
    public let realAddress: String
    public let phone: String

    public init(
        id: Int,
        title: String,
        doctorName: String,
        realAddress: String,
        phone: String
    ) {
        self.id = id
        self.title = title
        self.doctorName = doctorName
        self.realAddress = realAddress
        self.phone = phone
    }
}
