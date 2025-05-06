import Foundation
import DBRCore

extension NetworkService: ProfileService {
    public func fetchPatientInfo() async throws -> PatientInfo {
        let data = try await client.send(Resources.patientInfo(accessTokenKey: accessTokenKey).get).data
        return PatientInfoMapper.map(data)
    }

    public func fetchLabResults() async throws -> [LabResult] {
        let data = try await client.send(Resources.labResults(accessTokenKey: accessTokenKey).get).data
        return data.map { LabResultMapper.map($0) }
    }

    public func fetchLabResultDetails(for id: Int) async throws -> LabResultDetails {
        let data = try await client.send(Resources.labResultDetails(accessTokenKey: accessTokenKey, id: id).get).data
        return LabResultDetailsMapper.map(data)
    }

    public func fetchDocuments() async throws -> [Document] {
        let data = try await client.send(Resources.documents(accessTokenKey: accessTokenKey).get).data
        return data.map { DocumentMapper.map($0) }
    }

    public func fetchDocumentDetails(for id: Int) async throws -> DocumentDetails {
        let data = try await client.send(Resources.documentDetails(accessTokenKey: accessTokenKey, id: id).get).data
        return DocumentDetailsMapper.map(data)
    }

    public func fetchConsultations() async throws -> [Consultation] {
        let data = try await client.send(Resources.consultations(accessTokenKey: accessTokenKey).get).data
        return data.map { ConsultationMapper.map($0) }
    }

    public func fetchConsultationDetails(for id: Int) async throws -> ConsultationDetails {
        let data = try await client.send(Resources.consultationDetails(accessTokenKey: accessTokenKey, id: id).get).data
        return ConsultationDetailsMapper.map(data)
    }

    public func uploadProfileAvatar(withJpeg data: Data) async throws {
        let base64String = data.base64EncodedString()
        let patientKey = Constant.mockPatientKey
        let body = AvatarDTO(patientKey: patientKey, imageBase64String: base64String)
        try await client.send(Resources.uploadAvatar(body: body).post)
    }
}
