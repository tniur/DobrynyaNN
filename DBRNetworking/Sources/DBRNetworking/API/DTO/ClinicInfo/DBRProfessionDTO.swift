import Foundation

public struct DBRProfessionDTO: Codable, Sendable {
    public let id: Int
    public let name: String
    public let doctorName: String

    private enum CodingKeys: String, CodingKey {
        case id, name
        case doctorName = "doctor_name"
    }
}
