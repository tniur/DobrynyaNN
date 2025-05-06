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
            categoryId: dto.categoryId,
            shortDesc: dto.shortDesc,
            fullDesc: dto.fullDesc
        )
    }
}
