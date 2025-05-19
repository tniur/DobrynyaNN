import Foundation
import DBRNetworking
import DBRCore

struct DBRRegisterConfirmationMapper {
    static func map(_ dto: DBRRegisterConfirmationResultDTO) -> DBRRegisterConfirmationResult {
        DBRRegisterConfirmationResult(accessToken: dto.patientKey)
    }
}
