import Foundation
import DBRNetworking
import DBRCore

struct ConfirmCodeMapper {
    static func map(_ dto: ConfirmCodeDTO) -> ConfirmationResult {
        ConfirmationResult(accessToken: dto.patientKey)
    }
}
