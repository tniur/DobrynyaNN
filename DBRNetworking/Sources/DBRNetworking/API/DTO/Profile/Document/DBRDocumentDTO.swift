import Foundation

public struct DBRDocumentDTO: Codable, Sendable {
    public let id: Int
    public let title: String
    public let doctorId: Int
    public let symptoms: String
    public let diagnosis: String
    public let conclusion: String
    public let recommendations: String
    public let isTemp: Bool
    public let dateReturn: String

    private enum CodingKeys: String, CodingKey {
        case id, title, symptoms, diagnosis, conclusion, recommendations
        case doctorId = "doctor_id"
        case isTemp = "is_temp"
        case dateReturn = "date_return"
    }
}
