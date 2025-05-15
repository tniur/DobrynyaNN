import Foundation

public struct DBRDoctorDTO: Codable, Sendable {
    public let id: Int
    public let avatarPath: String?
    public let avatarSmallPath: String?
    public let name: String
    public let birthDate: String
    public let gender: String
    public let phone: String
    public let email: String
    public let professionIds: [Int]
    public let professionsTitle: String
    public let clinic: [Int]
    public let services: [Int]

    private enum CodingKeys: String, CodingKey {
        case id, name, gender, phone, email, clinic, services
        case avatarPath = "avatar_path"
        case avatarSmallPath = "avatar_small_path"
        case birthDate = "birth_date"
        case professionIds = "profession_ids"
        case professionsTitle = "professions_title"
    }
}
