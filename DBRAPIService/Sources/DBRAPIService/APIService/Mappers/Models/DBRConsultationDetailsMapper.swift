import Foundation
import DBRNetworking
import DBRCore

struct DBRConsultationDetailsMapper {
    static func map(_ dto: DBRConsultationDetailsDTO) -> DBRConsultationDetails {
        DBRConsultationDetails(
            id: dto.id,
            title: dto.title,
            doctorId: dto.doctorId,
            status: DBRConsultationStatus(fromRawValue: dto.status),
            description: dto.desc
        )
    }
}
