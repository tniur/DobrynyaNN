import Foundation

public protocol ProfileService {
    func fetchPatientInfo() async throws -> PatientInfo
    func fetchLabResults() async throws -> [LabResult]
    func fetchDocuments() async throws -> [Document]
    func fetchConsultations() async throws -> [Consultation]
}
