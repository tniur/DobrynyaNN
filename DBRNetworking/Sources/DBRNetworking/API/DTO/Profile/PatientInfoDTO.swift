import Foundation

public struct PatientInfoDTO: Codable, Sendable {
    let lastName: String
    let firstName: String
    let thirdName: String
    let birthDate: String
    let age: Int
    let gender: String
    let mobile: String
    let email: String
    let avatarPath: String?

    private enum CodingKeys: String, CodingKey {
        case age, gender, mobile, email
        case lastName = "last_name"
        case firstName = "first_name"
        case thirdName = "third_name"
        case birthDate = "birth_date"
        case avatarPath = "avatar_path"
    }
}
