import Foundation

public struct Doctor: Sendable {
    public let id: Int
    public let avatarUrl: String?
    public let avatarSmallUrl: String?
    public let name: String
    public let birthDate: String
    public let gender: String
    public let phone: String
    public let email: String
    public let profession: [Int]
    public let clinic: [Int]
    public let services: [Int]

    public init(
        id: Int,
        avatarUrl: String?,
        avatarSmallUrl: String?,
        name: String,
        birthDate: String,
        gender: String,
        phone: String,
        email: String,
        profession: [Int],
        clinic: [Int],
        services: [Int]
    ) {
        self.id = id
        self.avatarUrl = avatarUrl
        self.avatarSmallUrl = avatarSmallUrl
        self.name = name
        self.birthDate = birthDate
        self.gender = gender
        self.phone = phone
        self.email = email
        self.profession = profession
        self.clinic = clinic
        self.services = services
    }
}
