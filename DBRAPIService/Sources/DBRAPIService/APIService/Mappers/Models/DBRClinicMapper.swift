import Foundation
import DBRNetworking
import DBRCore

struct DBRClinicMapper {
    static func map(_ dto: DBRClinicDTO) -> DBRClinic {
        DBRClinic(
            id: dto.id,
            title: dto.title,
            doctorName: dto.doctorName,
            realAddress: dto.realAddress,
            phone: dto.phone
        )
    }
}
