import Foundation
import DBRCore

public struct DocumentDetailsDTO: Codable, Sendable {
    public let title: String
    public let doctorId: Int
    public let symptoms: String
    public let diagnosis: String
    public let conclusion: String
    public let recommendations: String
    public let isTemp: Bool
    public let dateReturn: String
    public let pdfContent: String

    private enum CodingKeys: String, CodingKey {
        case title, symptoms, diagnosis, conclusion, recommendations
        case doctorId = "doctor_id"
        case isTemp = "is_temp"
        case dateReturn = "date_return"
        case pdfContent = "pdf_content"
    }

    func toDomain() -> DocumentDetails {
        DocumentDetails(
            title: title,
            doctorId: doctorId,
            symptoms: symptoms,
            diagnosis: diagnosis,
            conclusion: conclusion,
            recommendations: recommendations,
            isTemp: isTemp,
            dateReturn: dateReturn,
            pdfContent: pdfContent
        )
    }
}
