import Foundation

public struct DBRDoctor: Sendable, Identifiable {
    public let id: Int
    public let avatarUrl: String?
    public let avatarSmallUrl: String?
    public let name: String
    public let birthDate: String
    public let gender: String
    public let phone: String
    public let email: String
    public let professionIds: [Int]
    public let professionsTitle: String
    public let clinicIds: [Int]
    public let servicesIds: [Int]

    public init(
        id: Int,
        avatarUrl: String?,
        avatarSmallUrl: String?,
        name: String,
        birthDate: String,
        gender: String,
        phone: String,
        email: String,
        professionIds: [Int],
        professionsTitle: String,
        clinicIds: [Int],
        servicesIds: [Int]
    ) {
        self.id = id
        self.avatarUrl = avatarUrl
        self.avatarSmallUrl = avatarSmallUrl
        self.name = name
        self.birthDate = birthDate
        self.gender = gender
        self.phone = phone
        self.email = email
        self.professionIds = professionIds
        self.professionsTitle = professionsTitle
        self.clinicIds = clinicIds
        self.servicesIds = servicesIds
    }
}
