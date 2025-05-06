import Foundation
import DBRCore

struct ServiceCategoryMapper {
    static func map(_ dto: ServiceCategoryDTO) -> ServiceCategory {
        ServiceCategory(id: dto.id, title: dto.title)
    }
}
