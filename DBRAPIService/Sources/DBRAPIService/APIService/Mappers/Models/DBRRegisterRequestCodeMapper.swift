import Foundation
import DBRNetworking
import DBRCore

struct DBRRegisterRequestCodeMapper {
    static func map(_ dto: DBRRegisterRequestCodeResultDTO) -> DBRRegisterRequestCodeResult {
        DBRRegisterRequestCodeResult(phone: dto.phone)
    }
}
