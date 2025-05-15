import Foundation
import DBRNetworking
import DBRCore

struct DBRProfessionMapper {
    static func map(_ dto: DBRProfessionDTO) -> DBRProfession {
        DBRProfession(id: dto.id, name: dto.name, doctorName: dto.doctorName)
    }
}
