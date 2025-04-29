import Foundation

public struct PatientInfo: Sendable {
    public let lastName: String
    public let firstName: String
    public let thirdName: String
    public let birthDate: String
    public let age: Int
    public let gender: String
    public let mobile: String
    public let email: String
    public let avatarUrl: String

    public init(
        lastName: String,
        firstName: String,
        thirdName: String,
        birthDate: String,
        age: Int,
        gender: String,
        mobile: String,
        email: String,
        avatarUrl: String
    ) {
        self.lastName = lastName
        self.firstName = firstName
        self.thirdName = thirdName
        self.birthDate = birthDate
        self.age = age
        self.gender = gender
        self.mobile = mobile
        self.email = email
        self.avatarUrl = avatarUrl
    }
}
