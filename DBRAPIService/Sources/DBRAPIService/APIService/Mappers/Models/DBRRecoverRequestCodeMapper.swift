import Foundation
import DBRNetworking
import DBRCore

struct DBRRecoverRequestCodeMapper {
    static func map(_ dto: DBRRecoverRequestCodeResultDTO) -> DBRRecoverRequestCodeResult {
        DBRRecoverRequestCodeResult(phoneMasked: dto.phoneMasked)
    }
}
