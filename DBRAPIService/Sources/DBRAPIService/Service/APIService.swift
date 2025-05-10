import Foundation
import DBRCore
import DBRNetworking

public final class APIService {
    let client: NetworkClientProtocol
    let tokenProvider: TokenProvider

    public init(client: NetworkClientProtocol, tokenProvider: TokenProvider) {
        self.client = client
        self.tokenProvider = tokenProvider
    }

    func handle(_ error: Error) -> DomainError {
        if let networkError = error as? NetworkError {
            return NetworkErrorMapper.map(networkError)
        } else if error is KeychainStorageError {
            return .unauthorized
        } else {
            return .unknown
        }
    }
}
