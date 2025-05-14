import Foundation
import DBRNetworking
import DBRCore

struct DBRConfirmCodeMapper {
    static func map(_ dto: DBRConfirmCodeDTO) -> DBRConfirmationResult {
        DBRConfirmationResult(accessToken: dto.patientKey)
    }
}
