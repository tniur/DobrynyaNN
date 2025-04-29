import Foundation
import DBRCore

extension NetworkAPI: ProfileService {
    public func fetchPatientInfo() async throws -> PatientInfo {
        let data = try await client.send(Resources.patientInfo().get).data
        return data.toDomain()
    }

    public func fetchLabResults() async throws -> [LabResult] {
        let data = try await client.send(Resources.labResults().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchLabResultDetails(for id: Int) async throws -> LabResultDetails {
        let data = try await client.send(Resources.labResultDetails(id: id).get).data
        return data.toDomain()
    }

    public func fetchDocuments() async throws -> [Document] {
        let data = try await client.send(Resources.documents().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchDocumentDetails(for id: Int) async throws -> DocumentDetails {
        let data = try await client.send(Resources.documentDetails(id: id).get).data
        return data.toDomain()
    }

    public func fetchConsultations() async throws -> [Consultation] {
        let data = try await client.send(Resources.consultations().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchConsultationDetails(for id: Int) async throws -> ConsultationDetails {
        let data = try await client.send(Resources.consultationDetails(id: id).get).data
        return data.toDomain()
    }
}
