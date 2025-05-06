import Foundation

// MARK: - PatientInfo

extension Resources {
    public struct PatientInfoResource {
        let path: String
        let key: String

        public var get: Request<DataResponse<PatientInfoDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func patientInfo(accessTokenKey: String) -> PatientInfoResource {
        PatientInfoResource(path: Endpoint.patientInfo, key: accessTokenKey)
    }
}

// MARK: - LabResults

extension Resources {
    public struct LabResultsResource {
        let path: String
        let key: String

        public var get: Request<DataResponse<[LabResultDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResults(accessTokenKey: String) -> LabResultsResource {
        LabResultsResource(path: Endpoint.labResults, key: accessTokenKey)
    }
}

extension Resources {
    public struct LabResultDetailsResource {
        let path: String
        let key: String
        let id: Int

        public var get: Request<DataResponse<LabResultDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("result_id", String(id)))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResultDetails(accessTokenKey: String, id: Int) -> LabResultDetailsResource {
        LabResultDetailsResource(path: Endpoint.labResultDetails, key: accessTokenKey, id: id)
    }
}

// MARK: - Documents

extension Resources {
    public struct DocumentsResource {
        let path: String
        let key: String

        public var get: Request<DataResponse<[DocumentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documents(accessTokenKey: String) -> DocumentsResource {
        DocumentsResource(path: Endpoint.documents, key: accessTokenKey)
    }
}

extension Resources {
    public struct DocumentDetailsResource {
        let path: String
        let key: String
        let id: Int

        public var get: Request<DataResponse<DocumentDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("document_id", String(id)))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documentDetails(accessTokenKey: String, id: Int) -> DocumentDetailsResource {
        DocumentDetailsResource(path: Endpoint.documentDetails, key: accessTokenKey, id: id)
    }
}

// MARK: - Consultations

extension Resources {
    public struct ConsultationsResource {
        let path: String
        let key: String

        public var get: Request<DataResponse<[ConsultationDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultations(accessTokenKey: String) -> ConsultationsResource {
        ConsultationsResource(path: Endpoint.consultations, key: accessTokenKey)
    }
}

extension Resources {
    public struct ConsultationDetailsResource {
        let path: String
        let key: String
        let id: Int

        public var get: Request<DataResponse<ConsultationDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))
            query.append(("consultation_id", String(id)))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultationDetails(accessTokenKey: String, id: Int) -> ConsultationDetailsResource {
        ConsultationDetailsResource(path: Endpoint.consultationDetails, key: accessTokenKey, id: id)
    }
}

// MARK: - Avatar

extension Resources {
    public struct UploadAvatarResource {
        let path: String = Endpoint.uploadPatientAvatar
        let body: AvatarDTO

        public var post: Request<Void> {
            Request(method: .post, path: path, body: body)
        }
    }

    public static func uploadAvatar(body: AvatarDTO) -> UploadAvatarResource {
        UploadAvatarResource(body: body)
    }
}
