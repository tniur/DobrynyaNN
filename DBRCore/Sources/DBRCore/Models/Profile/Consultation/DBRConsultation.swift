import Foundation

public struct DBRConsultation: Sendable, Identifiable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let doctorName: String
    public let status: DBRConsultationStatus

    public init(id: Int, title: String, doctorId: Int, doctorName: String, status: DBRConsultationStatus) {
        self.id = id
        self.title = title
        self.doctorId = doctorId
        self.doctorName = doctorName
        self.status = status
    }
}
