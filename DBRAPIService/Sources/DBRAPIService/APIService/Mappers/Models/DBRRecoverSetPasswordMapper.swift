import Foundation
import DBRNetworking
import DBRCore

struct DBRRecoverSetPasswordMapper {
    static func map(_ dto: DBRRecoverSetPasswordResultDTO) -> DBRRecoverSetPasswordResult {
        DBRRecoverSetPasswordResult(accessToken: dto.patientKey)
    }
}
