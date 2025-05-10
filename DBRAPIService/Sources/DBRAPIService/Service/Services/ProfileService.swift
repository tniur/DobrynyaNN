import Foundation
import DBRNetworking
import DBRCore

extension APIService: ProfileService {
    public func fetchPatientInfo() async throws -> PatientInfo {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(Resources.patientInfo(accessTokenKey: key).get).data
            return PatientInfoMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func fetchLabResults() async throws -> [LabResult] {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(Resources.labResults(accessTokenKey: key).get).data
            return data.map { LabResultMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchLabResultDetails(for id: Int) async throws -> LabResultDetails {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(
                Resources.labResultDetails(
                    accessTokenKey: key,
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
            let key = try tokenProvider.getToken()
            let data = try await client.send(Resources.documents(accessTokenKey: key).get).data
            return data.map { DocumentMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchDocumentDetails(for id: Int) async throws -> DocumentDetails {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(
                Resources.documentDetails(
                    accessTokenKey: key,
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
            let key = try tokenProvider.getToken()
            let data = try await client.send(Resources.consultations(accessTokenKey: key).get).data
            return data.map { ConsultationMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchConsultationDetails(for id: Int) async throws -> ConsultationDetails {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(
                Resources.consultationDetails(
                    accessTokenKey: key,
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
            let key = try tokenProvider.getToken()
            let base64String = data.base64EncodedString()
            let body = AvatarDTO(patientKey: key, imageBase64String: base64String)
            let data = try await client.sendValidated(Resources.uploadAvatar(body: body).post).data
            return UploadProfileAvatarMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
