import Foundation

public protocol NetworkClientProtocol {
    func send<T: Decodable & Sendable>(_ request: Request<T>) async throws -> T
    func send(_ request: Request<Void>) async throws
}

public final class NetworkService {
    let client: NetworkClientProtocol
    let accessTokenKey: String

    public init(client: NetworkClientProtocol, accessTokenKey: String) {
        self.client = client
        self.accessTokenKey = accessTokenKey
    }
}
