import Foundation

public struct DBRConsultation: Sendable, Identifiable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let status: DBRConsultationStatus

    public init(id: Int, title: String, doctorId: Int, status: DBRConsultationStatus) {
        self.id = id
        self.title = title
        self.doctorId = doctorId
        self.status = status
    }
}
