import Foundation

public struct ConsultationDetails: Sendable, Identifiable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let status: ConsultationStatus
    public let description: String

    public init(id: Int, title: String, doctorId: Int, status: ConsultationStatus, description: String) {
        self.id = id
        self.title = title
        self.doctorId = doctorId
        self.status = status
        self.description = description
    }
}
