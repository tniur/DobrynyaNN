import Foundation
import DBRNetworking
import DBRCore

struct ConsultationDetailsMapper {
    static func map(_ dto: ConsultationDetailsDTO) -> ConsultationDetails {
        ConsultationDetails(
            id: dto.id,
            title: dto.title,
            doctorId: dto.doctorId,
            status: ConsultationStatus(fromRawValue: dto.status),
            desc: dto.desc
        )
    }
}
