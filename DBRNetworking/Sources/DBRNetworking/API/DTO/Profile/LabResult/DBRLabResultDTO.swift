import Foundation

public struct DBRLabResultDTO: Codable, Sendable {
    public let resultId: Int
    public let filesCount: Int
    public let dateCreated: String
    public let clinicId: Int

    private enum CodingKeys: String, CodingKey {
        case resultId = "result_id"
        case filesCount = "files_count"
        case dateCreated = "date_created"
        case clinicId = "clinic_id"
    }
}
