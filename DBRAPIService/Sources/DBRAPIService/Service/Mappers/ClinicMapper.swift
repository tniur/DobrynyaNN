import Foundation
import DBRNetworking
import DBRCore

struct ClinicMapper {
    static func map(_ dto: ClinicDTO) -> Clinic {
        Clinic(
            title: dto.title,
            doctorName: dto.doctorName,
            id: dto.id,
            realAddress: dto.realAddress,
            phone: dto.phone
        )
    }
}
