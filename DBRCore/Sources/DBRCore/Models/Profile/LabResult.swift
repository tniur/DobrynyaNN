import Foundation

public struct LabResult: Sendable {
    public let resultId: Int
    public let filesCount: Int
    public let dateCreated: String
    public let clinicId: Int

    public init(resultId: Int, filesCount: Int, dateCreated: String, clinicId: Int) {
        self.resultId = resultId
        self.filesCount = filesCount
        self.dateCreated = dateCreated
        self.clinicId = clinicId
    }
}
