import Foundation

public struct DBRLabResultDTO: Codable, Sendable {
    public let resultId: Int
    public let filesCount: Int
    public let dateCreated: String
    public let clinicId: Int
    public let serviceId: Int
    public let serviceName: String
    public let status: String

    private enum CodingKeys: String, CodingKey {
        case status
        case resultId = "result_id"
        case filesCount = "files_count"
        case dateCreated = "date_created"
        case clinicId = "clinic_id"
        case serviceId = "service_id"
        case serviceName = "service_name"
    }
}
