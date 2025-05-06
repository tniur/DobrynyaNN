import Foundation

public struct Service: Sendable {
    public let id: Int
    public let title: String
    public let price: Int
    public let duration: Int
    public let professionId: Int
    public let categoryId: [Int]
    public let shortDesc: String
    public let fullDesc: String

    public init(
        id: Int,
        title: String,
        price: Int,
        duration: Int,
        professionId: Int,
        categoryId: [Int],
        shortDesc: String,
        fullDesc: String
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.duration = duration
        self.professionId = professionId
        self.categoryId = categoryId
        self.shortDesc = shortDesc
        self.fullDesc = fullDesc
    }
}
