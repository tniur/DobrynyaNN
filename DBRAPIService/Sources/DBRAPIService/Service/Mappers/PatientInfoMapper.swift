import Foundation
import DBRNetworking
import DBRCore

struct PatientInfoMapper {
    static func map(_ dto: PatientInfoDTO) -> PatientInfo {
        PatientInfo(
            lastName: dto.lastName,
            firstName: dto.firstName,
            thirdName: dto.thirdName,
            birthDate: dto.birthDate,
            age: dto.age,
            gender: dto.gender,
            mobile: dto.mobile,
            email: dto.email,
            avatarUrl: dto.avatarPath.map { "\(Constant.baseURL)\($0)" }
        )
    }
}
