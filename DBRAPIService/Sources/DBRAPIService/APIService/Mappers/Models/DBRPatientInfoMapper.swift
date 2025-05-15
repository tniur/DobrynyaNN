import Foundation
import DBRNetworking
import DBRCore

struct DBRPatientInfoMapper {
    static func map(_ dto: DBRPatientInfoDTO) -> DBRPatientInfo {
        DBRPatientInfo(
            lastName: dto.lastName,
            firstName: dto.firstName,
            thirdName: dto.thirdName,
            birthDate: dto.birthDate,
            age: dto.age,
            gender: dto.gender,
            mobile: dto.mobile,
            email: dto.email,
            avatarUrl: dto.avatarPath.map { "\(DBREndpoint.baseURL)\($0)" }
        )
    }
}
