import Foundation

public protocol ProfileService {
    func fetchPatientInfo() async throws -> PatientInfo
    func fetchLabResults() async throws -> [LabResult]
    func fetchLabResultDetails(for id: Int) async throws -> LabResultDetails
    func fetchDocuments() async throws -> [Document]
    func fetchDocumentDetails(for id: Int) async throws -> DocumentDetails
    func fetchConsultations() async throws -> [Consultation]
    func fetchConsultationDetails(for id: Int) async throws -> ConsultationDetails
    func uploadProfileAvatar(withJpeg data: Data) async throws -> UploadProfileAvatarResult
}
