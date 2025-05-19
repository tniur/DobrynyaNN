import Foundation

public struct DBRRecoverSetPasswordResultDTO: Codable, Sendable {
    public let message: String
    public let patientKey: String

    private enum CodingKeys: String, CodingKey {
        case message
        case patientKey = "patient_key"
    }
}
