import Foundation

public struct LabResultDetails: Sendable {
    public let dateCreated: String
    public let clinicId: Int
    public let pdfFiles: [String]

    public init(dateCreated: String, clinicId: Int, pdfFiles: [String]) {
        self.dateCreated = dateCreated
        self.clinicId = clinicId
        self.pdfFiles = pdfFiles
    }
}
