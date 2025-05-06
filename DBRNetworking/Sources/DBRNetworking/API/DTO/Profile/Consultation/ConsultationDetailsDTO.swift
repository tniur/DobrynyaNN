import Foundation
import DBRCore

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

    func toDomain() -> ConsultationDetails {
        ConsultationDetails(
            id: id,
            title: title,
            doctorId: doctorId,
            status: ConsultationStatus(fromRawValue: status),
            desc: desc
        )
    }
}
