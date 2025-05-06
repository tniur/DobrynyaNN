import Foundation

public protocol NetworkClientProtocol {
    func send<T: Decodable & Sendable>(_ request: Request<T>) async throws -> T
    func send(_ request: Request<Void>) async throws
}
