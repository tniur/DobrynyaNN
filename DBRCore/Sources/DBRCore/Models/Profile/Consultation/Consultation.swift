import Foundation

public struct Consultation: Sendable, Identifiable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let status: ConsultationStatus

    public init(id: Int, title: String, doctorId: Int, status: ConsultationStatus) {
        self.id = id
        self.title = title
        self.doctorId = doctorId
        self.status = status
    }
}
