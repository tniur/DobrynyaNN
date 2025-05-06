import Foundation
import DBRNetworking
import DBRCore

struct DoctorMapper {
    static func map(_ dto: DoctorDTO) -> Doctor {
        Doctor(
            id: dto.id,
            avatarUrl: dto.avatarPath.map { "\(Constant.baseURL)\($0)" },
            avatarSmallUrl: dto.avatarSmallPath.map { "\(Constant.baseURL)\($0)" },
            name: dto.name,
            birthDate: dto.birthDate,
            gender: dto.gender,
            phone: dto.phone,
            email: dto.email,
            profession: dto.profession,
            clinic: dto.clinic,
            services: dto.services
        )
    }
}
