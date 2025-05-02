import Foundation
import DBRCore

public struct DoctorDTO: Codable, Sendable {
    let id: Int
    let avatarPath: String?
    let avatarSmallPath: String?
    let name: String
    let birthDate: String
    let gender: String
    let phone: String
    let email: String
    let profession: [Int]
    let clinic: [Int]
    let services: [Int]

    private enum CodingKeys: String, CodingKey {
        case id, name, gender, phone, email, profession, clinic, services
        case avatarPath = "avatar_path"
        case avatarSmallPath = "avatar_small_path"
        case birthDate = "birth_date"
    }

    func toDomain() -> Doctor {
        Doctor(
            id: id,
            avatarUrl: avatarPath.map { "\(Constant.baseURL)\($0)" },
            avatarSmallUrl: avatarSmallPath.map { "\(Constant.baseURL)\($0)" },
            name: name,
            birthDate: birthDate,
            gender: gender,
            phone: phone,
            email: email,
            profession: profession,
            clinic: clinic,
            services: services
        )
    }
}
