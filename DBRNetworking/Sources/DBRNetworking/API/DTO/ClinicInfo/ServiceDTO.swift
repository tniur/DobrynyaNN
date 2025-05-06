import Foundation

public struct ServiceDTO: Codable, Sendable {
    let id: Int
    let title: String
    let price: Int
    let duration: Int
    let professionId: Int
    let categoryId: [Int]
    let shortDesc: String
    let fullDesc: String

    private enum CodingKeys: String, CodingKey {
        case id, title, price, duration
        case professionId = "profession_id"
        case categoryId = "category_id"
        case shortDesc = "short_desc"
        case fullDesc = "full_desc"
    }
}
