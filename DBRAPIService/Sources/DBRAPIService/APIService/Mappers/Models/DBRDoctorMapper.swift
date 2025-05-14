import Foundation
import DBRNetworking
import DBRCore

struct DBRDoctorMapper {
    static func map(_ dto: DBRDoctorDTO) -> DBRDoctor {
        DBRDoctor(
            id: dto.id,
            avatarUrl: dto.avatarPath.map { "\(DBREndpoint.baseURL)\($0)" },
            avatarSmallUrl: dto.avatarSmallPath.map { "\(DBREndpoint.baseURL)\($0)" },
            name: dto.name,
            birthDate: dto.birthDate,
            gender: dto.gender,
            phone: dto.phone,
            email: dto.email,
            professionIds: dto.profession,
            clinicIds: dto.clinic,
            servicesIds: dto.services
        )
    }
}
