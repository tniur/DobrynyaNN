import Foundation
import DBRNetworking
import DBRCore

struct DBRServiceMapper {
    static func map(_ dto: DBRServiceDTO) -> DBRService {
        DBRService(
            id: dto.id,
            title: dto.title,
            price: dto.price,
            duration: dto.duration,
            professionId: dto.professionId,
            professionTitle: dto.professionTitle,
            categoryIds: dto.categoryId,
            shortDescription: dto.shortDesc,
            fullDescription: dto.fullDesc
        )
    }
}
