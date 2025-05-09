import Foundation
import DBRNetworking
import DBRCore

struct DocumentDetailsMapper {
    static func map(_ dto: DocumentDetailsDTO) -> DocumentDetails {
        DocumentDetails(
            title: dto.title,
            doctorId: dto.doctorId,
            symptoms: dto.symptoms,
            diagnosis: dto.diagnosis,
            conclusion: dto.conclusion,
            recommendations: dto.recommendations,
            isTemporary: dto.isTemp,
            dateReturn: dto.dateReturn,
            pdfContent: dto.pdfContent
        )
    }
}
