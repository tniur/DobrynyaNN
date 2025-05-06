import Foundation

public struct ClinicDTO: Codable, Sendable {
    let title: String
    let doctorName: String
    let id: Int
    let realAddress: String
    let phone: String

    private enum CodingKeys: String, CodingKey {
        case title, id, phone
        case doctorName = "doctor_name"
        case realAddress = "real_address"
    }
}
