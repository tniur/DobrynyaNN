import Foundation
import DBRNetworking
import DBRCore

struct DBRDocumentMapper {
    static func map(_ dto: DBRDocumentDTO) -> DBRDocument {
        DBRDocument(
            id: dto.id,
            title: dto.title,
            doctorId: dto.doctorId,
            symptoms: dto.symptoms,
            diagnosis: dto.diagnosis,
            conclusion: dto.conclusion,
            recommendations: dto.recommendations,
            isTemporary: dto.isTemp,
            dateReturn: dto.dateReturn
        )
    }
}
