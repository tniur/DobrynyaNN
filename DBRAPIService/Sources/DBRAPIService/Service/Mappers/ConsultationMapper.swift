import Foundation
import DBRNetworking
import DBRCore

struct ConsultationMapper {
    static func map(_ dto: ConsultationDTO) -> Consultation {
        Consultation(
            id: dto.id,
            title: dto.title,
            doctorId: dto.doctorId,
            status: ConsultationStatus(fromRawValue: dto.status)
        )
    }
}
