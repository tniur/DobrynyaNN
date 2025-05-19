import Foundation
import DBRNetworking
import DBRCore

struct DBRAuthConfirmCodeMapper {
    static func map(_ dto: DBRAuthConfirmCodeResultDTO) -> DBRAuthConfirmationResult {
        DBRAuthConfirmationResult(accessToken: dto.patientKey)
    }
}
