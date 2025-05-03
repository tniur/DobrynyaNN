import Foundation

public struct ConsultationDetails: Sendable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let status: ConsultationStatus
    public let desc: String

    public init(id: Int, title: String, doctorId: Int, status: ConsultationStatus, desc: String) {
        self.id = id
        self.title = title
        self.doctorId = doctorId
        self.status = status
        self.desc = desc
    }
}
