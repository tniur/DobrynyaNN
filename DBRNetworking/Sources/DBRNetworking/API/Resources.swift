import Foundation
import DBRCore

public struct DataResponse<Response: Codable>: Codable, @unchecked Sendable {
    public let data: Response
}

public enum Resources {}

// MARK: - Profile

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
    public struct ConsultationResource {
        let path: String

        public var get: Request<DataResponse<[ConsultationDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func consultations() -> ConsultationResource {
        ConsultationResource(path: Endpoint.consultations)
    }
}
