import Foundation
import DBRNetworking
import DBRCore

struct DBRAuthRequestCodeMapper {
    static func map(_ dto: DBRAuthRequestCodeResultDTO) -> DBRAuthRequestCodeResult {
        DBRAuthRequestCodeResult(phoneMasked: dto.phoneMasked)
    }
}
