import Foundation

public struct DBRConsultationDTO: Codable, Sendable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let doctorName: String
    public let status: String

    private enum CodingKeys: String, CodingKey {
        case id, title, status
        case doctorId = "doctor_id"
        case doctorName = "doctor_name"
    }
}
