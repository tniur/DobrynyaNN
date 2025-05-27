import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRProfileService {
    public func fetchPatientInfo() async throws -> DBRPatientInfo {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(DBRResources.patientInfo(accessTokenKey: key).get).data
            return DBRPatientInfoMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func fetchLabResults() async throws -> [DBRLabResult] {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(DBRResources.labResults(accessTokenKey: key).get).data
            return data.map { DBRLabResultMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchLabResultDetails(for id: Int) async throws -> DBRLabResultDetails {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(
                DBRResources.labResultDetails(
                    accessTokenKey: key,
                    id: id
                ).get
            ).data
            return DBRLabResultDetailsMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func fetchDocuments() async throws -> [DBRDocument] {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(DBRResources.documents(accessTokenKey: key).get).data
            return data.map { DBRDocumentMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchDocumentDetails(for id: Int) async throws -> DBRDocumentDetails {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(
                DBRResources.documentDetails(
                    accessTokenKey: key,
                    id: id
                ).get
            ).data
            return DBRDocumentDetailsMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func fetchConsultations() async throws -> [DBRConsultation] {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(DBRResources.consultations(accessTokenKey: key).get).data
            return data.map { DBRConsultationMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchConsultationDetails(for id: Int) async throws -> DBRConsultationDetails {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(
                DBRResources.consultationDetails(
                    accessTokenKey: key,
                    id: id
                ).get
            ).data
            return DBRConsultationDetailsMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func uploadProfileAvatar(withJpeg data: Data) async throws -> DBRUploadProfileAvatarResult {
        do {
            let key = try tokenProvider.getToken()
            let base64String = data.base64EncodedString()
            let body = DBRAvatarDTO(patientKey: key, imageBase64String: base64String)
            let data = try await client.sendValidated(DBRResources.uploadAvatar(body: body).post).data
            return DBRUploadProfileAvatarMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
    
    public func updatePatientInfo(
        with data: DBRUpdatePatientInfo
    ) async throws -> DBRUpdatePatientInfoResult {
        do {
            let key = try tokenProvider.getToken()
            let body = DBRUpdatePatientInfoMapper.map(data, patientKey: key)
            let data = try await client.send(DBRResources.updatePatientInfo(body: body).put).data
            return DBRUpdatePatientInfoResultMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
