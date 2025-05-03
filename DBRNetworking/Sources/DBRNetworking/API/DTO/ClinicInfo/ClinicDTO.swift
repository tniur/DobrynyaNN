import Foundation
import DBRCore

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

    func toDomain() -> Clinic {
        Clinic(title: title, doctorName: doctorName, id: id, realAddress: realAddress, phone: phone)
    }
}
