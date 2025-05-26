import Foundation

public struct DBRUpdatePatientInfo: Sendable {
    public let lastName: String
    public let firstName: String
    public let thirdName: String?

    public init(
        lastName: String,
        firstName: String,
        thirdName: String?
    ) {
        self.lastName = lastName
        self.firstName = firstName
        self.thirdName = thirdName
    }
}
