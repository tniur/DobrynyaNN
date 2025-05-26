import Foundation

public struct DBRUpdatePatientInfoDTO: Encodable, Sendable {
    public let patientKey: String
    public let lastName: String
    public let firstName: String
    public let thirdName: String?

    private enum CodingKeys: String, CodingKey {
        case patientKey = "patient_key"
        case lastName = "last_name"
        case firstName = "first_name"
        case thirdName = "third_name"
    }

    public init(patientKey: String, lastName: String, firstName: String, thirdName: String?) {
        self.patientKey = patientKey
        self.lastName = lastName
        self.firstName = firstName
        self.thirdName = thirdName
    }
}
