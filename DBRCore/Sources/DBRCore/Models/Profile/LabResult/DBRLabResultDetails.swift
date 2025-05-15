import Foundation

public struct DBRLabResultDetails: Sendable {
    public let dateCreated: String
    public let clinicId: Int
    public let serviceId: Int
    public let serviceTitle: String
    public let status: DBRLabResultStatus
    public let pdfFiles: [String]

    public init(
        dateCreated: String,
        clinicId: Int,
        serviceId: Int,
        serviceTitle: String,
        status: DBRLabResultStatus,
        pdfFiles: [String]
    ) {
        self.dateCreated = dateCreated
        self.clinicId = clinicId
        self.serviceId = serviceId
        self.serviceTitle = serviceTitle
        self.status = status
        self.pdfFiles = pdfFiles
    }
}
