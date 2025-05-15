import Foundation

public struct DBRServiceDTO: Codable, Sendable {
    public let id: Int
    public let title: String
    public let price: Int
    public let duration: Int
    public let professionId: Int
    public let professionTitle: String
    public let categoryId: [Int]
    public let shortDesc: String
    public let fullDesc: String

    private enum CodingKeys: String, CodingKey {
        case id, title, price, duration
        case professionId = "profession_id"
        case professionTitle = "profession_title"
        case categoryId = "category_id"
        case shortDesc = "short_desc"
        case fullDesc = "full_desc"
    }
}
