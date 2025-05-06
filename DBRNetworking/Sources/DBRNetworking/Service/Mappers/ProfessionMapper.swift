import Foundation
import DBRCore

struct ProfessionMapper {
    static func map(_ dto: ProfessionDTO) -> Profession {
        Profession(id: dto.id, name: dto.name, doctorName: dto.doctorName)
    }
}
