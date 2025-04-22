import Foundation

public struct Consultation: Sendable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let status: String

    public init(id: Int, title: String, doctorId: Int, status: String) {
        self.id = id
        self.title = title
        self.doctorId = doctorId
        self.status = status
    }
}
