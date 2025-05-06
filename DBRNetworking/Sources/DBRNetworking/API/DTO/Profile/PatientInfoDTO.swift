import Foundation

public struct PatientInfoDTO: Codable, Sendable {
    public let lastName: String
    public let firstName: String
    public let thirdName: String
    public let birthDate: String
    public let age: Int
    public let gender: String
    public let mobile: String
    public let email: String
    public let avatarPath: String?

    private enum CodingKeys: String, CodingKey {
        case age, gender, mobile, email
        case lastName = "last_name"
        case firstName = "first_name"
        case thirdName = "third_name"
        case birthDate = "birth_date"
        case avatarPath = "avatar_path"
    }
}
