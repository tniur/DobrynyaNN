import Foundation
import DBRCore

public protocol NetworkProtocol {
    func send<T: Decodable & Sendable>(_ request: Request<T>) async throws -> T
    func send(_ request: Request<Void>) async throws -> Void
}

public final class NetworkAPI {
    let client: NetworkProtocol

    public init(client: NetworkProtocol) {
        self.client = client
    }
}

extension NetworkAPI: ProfileService {
    public func fetchPatientInfo() async throws -> PatientInfo {
        let data = try await client.send(Resources.patientInfo().get).data
        return data.toDomain()
    }

    public func fetchLabResults() async throws -> [LabResult] {
        let data = try await client.send(Resources.labResults().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchDocuments() async throws -> [Document] {
        let data = try await client.send(Resources.documents().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchConsultations() async throws -> [Consultation] {
        let data = try await client.send(Resources.consultations().get).data
        return data.map { $0.toDomain() }
    }
}
