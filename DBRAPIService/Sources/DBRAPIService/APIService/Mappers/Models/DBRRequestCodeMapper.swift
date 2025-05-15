import Foundation
import DBRNetworking
import DBRCore

struct DBRRequestCodeMapper {
    static func map(_ dto: DBRRequestCodeDTO) -> DBRRequestCodeResult {
        DBRRequestCodeResult(phoneMasked: dto.phoneMasked)
    }
}
