import Foundation

public struct DBRService: Sendable, Identifiable {
    public let id: Int
    public let title: String
    public let price: Int
    public let duration: Int
    public let professionId: Int
    public let professionTitle: String
    public let categoryIds: [Int]
    public let shortDescription: String
    public let fullDescription: String

    public init(
        id: Int,
        title: String,
        price: Int,
        duration: Int,
        professionId: Int,
        professionTitle: String,
        categoryIds: [Int],
        shortDescription: String,
        fullDescription: String
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.duration = duration
        self.professionId = professionId
        self.professionTitle = professionTitle
        self.categoryIds = categoryIds
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
    }
}
