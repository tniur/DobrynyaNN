import Foundation

public struct ClinicDTO: Codable, Sendable {
    public let title: String
    public let doctorName: String
    public let id: Int
    public let realAddress: String
    public let phone: String

    private enum CodingKeys: String, CodingKey {
        case title, id, phone
        case doctorName = "doctor_name"
        case realAddress = "real_address"
    }
}
