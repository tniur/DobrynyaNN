import Foundation
import DBRNetworking
import DBRCore

struct DBRClinicMapper {
    static func map(_ dto: DBRClinicDTO) -> DBRClinic {
        DBRClinic(
            title: dto.title,
            doctorName: dto.doctorName,
            id: dto.id,
            realAddress: dto.realAddress,
            phone: dto.phone
        )
    }
}
