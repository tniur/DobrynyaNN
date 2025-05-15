import Foundation

public struct DBRLabResultDetailsDTO: Codable, Sendable {
    public let dateCreated: String
    public let clinicId: Int
    public let serviceId: Int
    public let serviceName: String
    public let status: String
    public let pdfFiles: [String]

    enum CodingKeys: String, CodingKey {
        case status
        case dateCreated = "date_created"
        case clinicId = "clinic_id"
        case pdfFiles = "pdf_files"
        case serviceId = "service_id"
        case serviceName = "service_name"
    }
}
