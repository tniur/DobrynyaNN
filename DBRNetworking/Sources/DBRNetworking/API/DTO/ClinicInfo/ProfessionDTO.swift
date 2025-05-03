import Foundation
import DBRCore

public struct ProfessionDTO: Codable, Sendable {
    let id: Int
    let name: String
    let doctorName: String

    private enum CodingKeys: String, CodingKey {
        case id, name
        case doctorName = "doctor_name"
    }

    func toDomain() -> Profession {
        Profession(id: id, name: name, doctorName: doctorName)
    }
}
