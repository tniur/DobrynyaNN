import Foundation
import DBRCore

// MARK: - PatientInfo

extension Resources {
    public struct PatientInfoResource {
        let path: String

        public var get: Request<DataResponse<PatientInfoDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func patientInfo() -> PatientInfoResource {
        PatientInfoResource(path: Endpoint.patientInfo)
    }
}

// MARK: - LabResults

extension Resources {
    public struct LabResultsResource {
        let path: String

        public var get: Request<DataResponse<[LabResultDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResults() -> LabResultsResource {
        LabResultsResource(path: Endpoint.labResults)
    }
}

extension Resources {
    public struct LabResultDetailsResource {
        let path: String
        let id: Int

        public var get: Request<DataResponse<LabResultDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))
            query.append(("result_id", String(id)))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func labResultDetails(id: Int) -> LabResultDetailsResource {
        LabResultDetailsResource(path: Endpoint.labResultDetails, id: id)
    }
}

// MARK: - Documents

extension Resources {
    public struct DocumentsResource {
        let path: String

        public var get: Request<DataResponse<[DocumentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documents() -> DocumentsResource {
        DocumentsResource(path: Endpoint.documents)
    }
}

extension Resources {
    public struct DocumentDetailsResource {
        let path: String
        let id: Int

        public var get: Request<DataResponse<DocumentDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))
            query.append(("document_id", String(id)))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func documentDetails(id: Int) -> DocumentDetailsResource {
        DocumentDetailsResource(path: Endpoint.documentDetails, id: id)
    }
}

// MARK: - Consultations

extension Resources {
    public struct ConsultationsResource {
        let path: String

        public var get: Request<DataResponse<[ConsultationDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultations() -> ConsultationsResource {
        ConsultationsResource(path: Endpoint.consultations)
    }
}

extension Resources {
    public struct ConsultationDetailsResource {
        let path: String
        let id: Int

        public var get: Request<DataResponse<ConsultationDetailsDTO>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))
            query.append(("consultation_id", String(id)))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultationDetails(id: Int) -> ConsultationDetailsResource {
        ConsultationDetailsResource(path: Endpoint.consultationDetails, id: id)
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
