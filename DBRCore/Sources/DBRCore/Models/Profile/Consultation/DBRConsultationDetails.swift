import Foundation

public struct DBRConsultationDetails: Sendable, Identifiable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let doctorName: String
    public let status: DBRConsultationStatus
    public let description: String

    public init(id: Int, title: String, doctorId: Int, doctorName: String, status: DBRConsultationStatus, description: String) {
        self.id = id
        self.title = title
        self.doctorId = doctorId
        self.doctorName = doctorName
        self.status = status
        self.description = description
    }
}
