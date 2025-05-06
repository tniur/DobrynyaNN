import Foundation

public struct ConsultationDetailsDTO: Codable, Sendable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let status: String
    public let desc: String

    enum CodingKeys: String, CodingKey {
        case id, title, status, desc
        case doctorId = "doctor_id"
    }
}
