import Foundation

public struct DBRConsultationDetailsDTO: Codable, Sendable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let doctorName: String
    public let status: String
    public let desc: String

    enum CodingKeys: String, CodingKey {
        case id, title, status, desc
        case doctorId = "doctor_id"
        case doctorName = "doctor_name"
    }
}
