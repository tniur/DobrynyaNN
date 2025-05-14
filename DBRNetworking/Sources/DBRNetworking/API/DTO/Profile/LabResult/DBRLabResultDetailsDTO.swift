import Foundation

public struct DBRLabResultDetailsDTO: Codable, Sendable {
    public let dateCreated: String
    public let clinicId: Int
    public let pdfFiles: [String]

    enum CodingKeys: String, CodingKey {
        case dateCreated = "date_created"
        case clinicId = "clinic_id"
        case pdfFiles = "pdf_files"
    }
}
