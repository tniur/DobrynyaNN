import Foundation

// MARK: - PatientInfo

extension Resources {
    public struct PatientInfoResource {
        let url: URL
        let path: String
        let key: String

        public var get: Request<DataResponse<PatientInfoDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func patientInfo(accessTokenKey: String) -> PatientInfoResource {
        PatientInfoResource(url: Endpoint.baseURL, path: Endpoint.Profile.patientInfo, key: accessTokenKey)
    }
}

// MARK: - LabResults

extension Resources {
    public struct LabResultsResource {
        let url: URL
        let path: String
        let key: String

        public var get: Request<DataResponse<[LabResultDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResults(accessTokenKey: String) -> LabResultsResource {
        LabResultsResource(url: Endpoint.baseURL, path: Endpoint.Profile.labResults, key: accessTokenKey)
    }
}

extension Resources {
    public struct LabResultDetailsResource {
        let url: URL
        let path: String
        let key: String
        let id: Int

        public var get: Request<DataResponse<LabResultDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("result_id", String(id)))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResultDetails(accessTokenKey: String, id: Int) -> LabResultDetailsResource {
        LabResultDetailsResource(
            url: Endpoint.baseURL,
            path: Endpoint.Profile.labResultDetails,
            key: accessTokenKey,
            id: id
        )
    }
}

// MARK: - Documents

extension Resources {
    public struct DocumentsResource {
        let url: URL
        let path: String
        let key: String

        public var get: Request<DataResponse<[DocumentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documents(accessTokenKey: String) -> DocumentsResource {
        DocumentsResource(url: Endpoint.baseURL, path: Endpoint.Profile.documents, key: accessTokenKey)
    }
}

extension Resources {
    public struct DocumentDetailsResource {
        let url: URL
        let path: String
        let key: String
        let id: Int

        public var get: Request<DataResponse<DocumentDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("document_id", String(id)))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documentDetails(accessTokenKey: String, id: Int) -> DocumentDetailsResource {
        DocumentDetailsResource(
            url: Endpoint.baseURL,
            path: Endpoint.Profile.documentDetails,
            key: accessTokenKey,
            id: id
        )
    }
}

// MARK: - Consultations

extension Resources {
    public struct ConsultationsResource {
        let url: URL
        let path: String
        let key: String

        public var get: Request<DataResponse<[ConsultationDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultations(accessTokenKey: String) -> ConsultationsResource {
        ConsultationsResource(url: Endpoint.baseURL, path: Endpoint.Profile.consultations, key: accessTokenKey)
    }
}

extension Resources {
    public struct ConsultationDetailsResource {
        let url: URL
        let path: String
        let key: String
        let id: Int

        public var get: Request<DataResponse<ConsultationDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("consultation_id", String(id)))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultationDetails(accessTokenKey: String, id: Int) -> ConsultationDetailsResource {
        ConsultationDetailsResource(
            url: Endpoint.baseURL,
            path: Endpoint.Profile.consultationDetails,
            key: accessTokenKey,
            id: id
        )
    }
}

// MARK: - Avatar

extension Resources {
    public struct UploadAvatarResource {
        let url: URL
        let path: String
        let body: AvatarDTO

        public var post: Request<DataResponse<UploadProfileAvatarDTO>> {
            Request(method: .post, url: url, path: path, body: body)
        }
    }

    public static func uploadAvatar(body: AvatarDTO) -> UploadAvatarResource {
        UploadAvatarResource(url: Endpoint.baseURL, path: Endpoint.Profile.uploadPatientAvatar, body: body)
    }
}
