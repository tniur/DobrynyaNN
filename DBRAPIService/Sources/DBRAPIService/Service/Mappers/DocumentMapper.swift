import Foundation
import DBRNetworking
import DBRCore

struct DocumentMapper {
    static func map(_ dto: DocumentDTO) -> Document {
        Document(
            id: dto.id,
            title: dto.title,
            doctorId: dto.doctorId,
            symptoms: dto.symptoms,
            diagnosis: dto.diagnosis,
            conclusion: dto.conclusion,
            recommendations: dto.recommendations,
            isTemp: dto.isTemp,
            dateReturn: dto.dateReturn
        )
    }
}
