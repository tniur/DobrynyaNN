import Foundation

public protocol NetworkProtocol {
    func send<T: Decodable & Sendable>(_ request: Request<T>) async throws -> T
    func send(_ request: Request<Void>) async throws
}

public final class NetworkAPI {
    let client: NetworkProtocol
    let accessTokenKey: String

    public init(client: NetworkProtocol) {
        self.client = client
        self.accessTokenKey = "xyz789"
    }
}
