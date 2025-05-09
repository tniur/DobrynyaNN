import Foundation
import DBRNetworking
import DBRCore

struct RequestCodeMapper {
    static func map(_ dto: RequestCodeDTO) -> RequestCodeResult {
        RequestCodeResult(phoneMasked: dto.phoneMasked)
    }
}
