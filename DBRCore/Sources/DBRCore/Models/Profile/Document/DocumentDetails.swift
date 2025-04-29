import Foundation

public struct DocumentDetails: Sendable {
    public let title: String
    public let doctorId: Int
    public let symptoms: String
    public let diagnosis: String
    public let conclusion: String
    public let recommendations: String
    public let isTemp: Bool
    public let dateReturn: String
    public let pdfContent: String

    public init(title: String,
                doctorId: Int,
                symptoms: String,
                diagnosis: String,
                conclusion: String,
                recommendations: String,
                isTemp: Bool,
                dateReturn: String,
                pdfContent: String
    ) {
        self.title = title
        self.doctorId = doctorId
        self.symptoms = symptoms
        self.diagnosis = diagnosis
        self.conclusion = conclusion
        self.recommendations = recommendations
        self.isTemp = isTemp
        self.dateReturn = dateReturn
        self.pdfContent = pdfContent
    }
}
