import Foundation
import DBRNetworking
import DBRCore

struct DBRUpdatePatientInfoMapper {
    static func map(_ domain: DBRUpdatePatientInfo, patientKey: String) -> DBRUpdatePatientInfoDTO {
        return DBRUpdatePatientInfoDTO(
            patientKey: patientKey,
            lastName: domain.lastName,
            firstName: domain.firstName,
            thirdName: domain.thirdName
        )
    }
}
