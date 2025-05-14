import Foundation

public protocol DBRNetworkClientProtocol {
    func send<T: Decodable & Sendable>(_ request: DBRRequest<T>) async throws -> T
    func send(_ request: DBRRequest<Void>) async throws
    func sendValidated<T: Decodable & Sendable & DBRValidatableResponse>(_ request: DBRRequest<T>) async throws -> T
}
