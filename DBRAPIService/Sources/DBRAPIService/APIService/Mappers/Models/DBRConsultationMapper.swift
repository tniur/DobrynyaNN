import Foundation
import DBRNetworking
import DBRCore

struct DBRConsultationMapper {
    static func map(_ dto: DBRConsultationDTO) -> DBRConsultation {
        DBRConsultation(
            id: dto.id,
            title: dto.title,
            doctorId: dto.doctorId,
            doctorName: dto.doctorName,
            status: DBRConsultationStatus(fromRawValue: dto.status)
        )
    }
}
