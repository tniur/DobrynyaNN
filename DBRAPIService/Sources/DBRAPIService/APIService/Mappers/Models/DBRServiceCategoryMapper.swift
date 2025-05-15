import Foundation
import DBRNetworking
import DBRCore

struct DBRServiceCategoryMapper {
    static func map(_ dto: DBRServiceCategoryDTO) -> DBRServiceCategory {
        DBRServiceCategory(id: dto.id, title: dto.title)
    }
}
