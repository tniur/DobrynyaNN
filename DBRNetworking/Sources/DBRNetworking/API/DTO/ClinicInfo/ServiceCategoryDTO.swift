import Foundation
import DBRCore

public struct ServiceCategoryDTO: Codable, Sendable {
    let id: Int
    let title: String

    func toDomain() -> ServiceCategory {
        ServiceCategory(id: id, title: title)
    }
}
