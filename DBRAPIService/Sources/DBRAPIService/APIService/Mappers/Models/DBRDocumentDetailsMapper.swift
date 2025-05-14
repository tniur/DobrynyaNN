import Foundation
import DBRNetworking
import DBRCore

struct DBRDocumentDetailsMapper {
    static func map(_ dto: DBRDocumentDetailsDTO) -> DBRDocumentDetails {
        DBRDocumentDetails(
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
