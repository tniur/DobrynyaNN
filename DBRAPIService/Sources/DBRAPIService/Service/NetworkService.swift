import Foundation
import DBRCore
import DBRNetworking

public final class NetworkService {
    let client: NetworkClientProtocol
    let accessTokenKey: String

    public init(client: NetworkClientProtocol, accessTokenKey: String) {
        self.client = client
        self.accessTokenKey = accessTokenKey
    }

    func handle(_ error: Error) -> DomainError {
        if let networkError = error as? NetworkError {
            return NetworkErrorMapper.map(networkError)
        } else {
            return .unknown
        }
    }
}
