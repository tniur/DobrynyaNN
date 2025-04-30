import Foundation
import DBRCore

public struct PatientInfoDTO: Codable, Sendable {
    let lastName: String
    let firstName: String
    let thirdName: String
    let birthDate: String
    let age: Int
    let gender: String
    let mobile: String
    let email: String
    let avatarUrl: String

    private enum CodingKeys: String, CodingKey {
        case age, gender, mobile, email
        case lastName = "last_name"
        case firstName = "first_name"
        case thirdName = "third_name"
        case birthDate = "birth_date"
        case avatarUrl = "avatar_url"
    }

    func toDomain() -> PatientInfo {
        PatientInfo(
            lastName: lastName,
            firstName: firstName,
            thirdName: thirdName,
            birthDate: birthDate,
            age: age,
            gender: gender,
            mobile: mobile,
            email: email,
            avatarUrl: avatarUrl
        )
    }
}
