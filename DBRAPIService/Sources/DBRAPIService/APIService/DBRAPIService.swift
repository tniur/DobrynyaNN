import Foundation
import DBRCore
import DBRNetworking

public final class DBRAPIService {
    let client: DBRNetworkClientProtocol
    let tokenProvider: DBRTokenProvider

    public init(client: DBRNetworkClientProtocol, tokenProvider: DBRTokenProvider) {
        self.client = client
        self.tokenProvider = tokenProvider
    }

    func handle(_ error: Error) -> DBRError {
        if let networkError = error as? DBRNetworkError {
            return DBRNetworkErrorMapper.map(networkError)
        } else if error is DBRKeychainStorageError {
            return .unauthorized
        } else {
            return .unknown
        }
    }
}
