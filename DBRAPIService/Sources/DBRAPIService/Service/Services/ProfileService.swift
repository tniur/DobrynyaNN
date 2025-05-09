import Foundation
import DBRNetworking
import DBRCore

extension APIService: ProfileService {
    public func fetchPatientInfo() async throws -> PatientInfo {
        do {
            let data = try await client.send(Resources.patientInfo(accessTokenKey: accessTokenKey).get).data
            return PatientInfoMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func fetchLabResults() async throws -> [LabResult] {
        do {
            let data = try await client.send(Resources.labResults(accessTokenKey: accessTokenKey).get).data
            return data.map { LabResultMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchLabResultDetails(for id: Int) async throws -> LabResultDetails {
        do {
            let data = try await client.send(
                Resources.labResultDetails(
                    accessTokenKey: accessTokenKey,
                    id: id
                ).get
            ).data
            return LabResultDetailsMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func fetchDocuments() async throws -> [Document] {
        do {
            let data = try await client.send(Resources.documents(accessTokenKey: accessTokenKey).get).data
            return data.map { DocumentMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchDocumentDetails(for id: Int) async throws -> DocumentDetails {
        do {
            let data = try await client.send(
                Resources.documentDetails(
                    accessTokenKey: accessTokenKey,
                    id: id
                ).get
            ).data
            return DocumentDetailsMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func fetchConsultations() async throws -> [Consultation] {
        do {
            let data = try await client.send(Resources.consultations(accessTokenKey: accessTokenKey).get).data
            return data.map { ConsultationMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchConsultationDetails(for id: Int) async throws -> ConsultationDetails {
        do {
            let data = try await client.send(
                Resources.consultationDetails(
                    accessTokenKey: accessTokenKey,
                    id: id
                ).get
            ).data
            return ConsultationDetailsMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func uploadProfileAvatar(withJpeg data: Data) async throws -> UploadProfileAvatarResult {
        do {
            let base64String = data.base64EncodedString()
            let body = AvatarDTO(patientKey: accessTokenKey, imageBase64String: base64String)
            let data = try await client.sendValidated(Resources.uploadAvatar(body: body).post).data
            return UploadProfileAvatarMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
