import Foundation

public struct DBRLabResult: Sendable, Identifiable {
    public let id: Int
    public let filesCount: Int
    public let dateCreated: String
    public let clinicId: Int

    public init(id: Int, filesCount: Int, dateCreated: String, clinicId: Int) {
        self.id = id
        self.filesCount = filesCount
        self.dateCreated = dateCreated
        self.clinicId = clinicId
    }
}
