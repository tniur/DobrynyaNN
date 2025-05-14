import Foundation

public struct DBRLabResult: Sendable, Identifiable {
    public let id: Int
    public let filesCount: Int
    public let dateCreated: String
    public let clinicId: Int
    public let serviceId: Int
    public let serviceTitle: String
    public let status: DBRLabResultStatus

    public init(
        id: Int,
        filesCount: Int,
        dateCreated: String,
        clinicId: Int,
        serviceId: Int,
        serviceTitle: String,
        status: DBRLabResultStatus
    ) {
        self.id = id
        self.filesCount = filesCount
        self.dateCreated = dateCreated
        self.clinicId = clinicId
        self.serviceId = serviceId
        self.serviceTitle = serviceTitle
        self.status = status
    }
}
