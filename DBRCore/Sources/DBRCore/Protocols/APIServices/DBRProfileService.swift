import Foundation

public protocol DBRProfileService {
    func fetchPatientInfo() async throws -> DBRPatientInfo
    func fetchLabResults() async throws -> [DBRLabResult]
    func fetchLabResultDetails(for id: Int) async throws -> DBRLabResultDetails
    func fetchDocuments() async throws -> [DBRDocument]
    func fetchDocumentDetails(for id: Int) async throws -> DBRDocumentDetails
    func fetchConsultations() async throws -> [DBRConsultation]
    func fetchConsultationDetails(for id: Int) async throws -> DBRConsultationDetails
    func uploadProfileAvatar(withJpeg data: Data) async throws -> DBRUploadProfileAvatarResult
    func updatePatientInfo(with data: DBRUpdatePatientInfo) async throws -> DBRUpdatePatientInfoResult
}
