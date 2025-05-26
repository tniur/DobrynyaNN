import Foundation

// MARK: - PatientInfo

extension DBRResources {
    public struct PatientInfoResource {
        let url: URL
        let path: String
        let key: String

        public var get: DBRRequest<DBRDataResponse<DBRPatientInfoDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func patientInfo(accessTokenKey: String) -> PatientInfoResource {
        PatientInfoResource(url: DBREndpoint.baseURL, path: DBREndpoint.Profile.patientInfo, key: accessTokenKey)
    }
}

// MARK: - LabResults

extension DBRResources {
    public struct LabResultsResource {
        let url: URL
        let path: String
        let key: String

        public var get: DBRRequest<DBRDataResponse<[DBRLabResultDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResults(accessTokenKey: String) -> LabResultsResource {
        LabResultsResource(url: DBREndpoint.baseURL, path: DBREndpoint.Profile.labResults, key: accessTokenKey)
    }
}

extension DBRResources {
    public struct LabResultDetailsResource {
        let url: URL
        let path: String
        let key: String
        let id: Int

        public var get: DBRRequest<DBRDataResponse<DBRLabResultDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("result_id", String(id)))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResultDetails(accessTokenKey: String, id: Int) -> LabResultDetailsResource {
        LabResultDetailsResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Profile.labResultDetails,
            key: accessTokenKey,
            id: id
        )
    }
}

// MARK: - Documents

extension DBRResources {
    public struct DocumentsResource {
        let url: URL
        let path: String
        let key: String

        public var get: DBRRequest<DBRDataResponse<[DBRDocumentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documents(accessTokenKey: String) -> DocumentsResource {
        DocumentsResource(url: DBREndpoint.baseURL, path: DBREndpoint.Profile.documents, key: accessTokenKey)
    }
}

extension DBRResources {
    public struct DocumentDetailsResource {
        let url: URL
        let path: String
        let key: String
        let id: Int

        public var get: DBRRequest<DBRDataResponse<DBRDocumentDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("document_id", String(id)))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documentDetails(accessTokenKey: String, id: Int) -> DocumentDetailsResource {
        DocumentDetailsResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Profile.documentDetails,
            key: accessTokenKey,
            id: id
        )
    }
}

// MARK: - Consultations

extension DBRResources {
    public struct ConsultationsResource {
        let url: URL
        let path: String
        let key: String

        public var get: DBRRequest<DBRDataResponse<[DBRConsultationDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultations(accessTokenKey: String) -> ConsultationsResource {
        ConsultationsResource(url: DBREndpoint.baseURL, path: DBREndpoint.Profile.consultations, key: accessTokenKey)
    }
}

extension DBRResources {
    public struct ConsultationDetailsResource {
        let url: URL
        let path: String
        let key: String
        let id: Int

        public var get: DBRRequest<DBRDataResponse<DBRConsultationDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("consultation_id", String(id)))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultationDetails(accessTokenKey: String, id: Int) -> ConsultationDetailsResource {
        ConsultationDetailsResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.Profile.consultationDetails,
            key: accessTokenKey,
            id: id
        )
    }
}

// MARK: - Avatar

extension DBRResources {
    public struct UploadAvatarResource {
        let url: URL
        let path: String
        let body: DBRAvatarDTO

        public var post: DBRRequest<DBRDataResponse<DBRUploadProfileAvatarDTO>> {
            DBRRequest(method: .post, url: url, path: path, body: body)
        }
    }

    public static func uploadAvatar(body: DBRAvatarDTO) -> UploadAvatarResource {
        UploadAvatarResource(url: DBREndpoint.baseURL, path: DBREndpoint.Profile.uploadPatientAvatar, body: body)
    }
}

// MARK: - Update Info

extension DBRResources {
    public struct UpdatePatientInfoResource {
        let url: URL
        let path: String
        let body: DBRUpdatePatientInfoDTO

        public var put: DBRRequest<DBRDataResponse<DBRUpdatePatientInfoResultDTO>> {
            DBRRequest(method: .put, url: url, path: path, body: body)
        }
    }

    public static func updatePatientInfo(body: DBRUpdatePatientInfoDTO) -> UpdatePatientInfoResource {
        UpdatePatientInfoResource(url: DBREndpoint.baseURL, path: DBREndpoint.Profile.updatePatientInfo, body: body)
    }
}
