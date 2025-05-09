import Foundation
import DBRNetworking
import DBRCore

struct ServiceMapper {
    static func map(_ dto: ServiceDTO) -> Service {
        Service(
            id: dto.id,
            title: dto.title,
            price: dto.price,
            duration: dto.duration,
            professionId: dto.professionId,
            categoryIds: dto.categoryId,
            shortDescription: dto.shortDesc,
            fullDescription: dto.fullDesc
        )
    }
}
