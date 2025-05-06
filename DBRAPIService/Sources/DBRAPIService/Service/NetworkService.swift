import Foundation
import DBRNetworking

public final class NetworkService {
    let client: NetworkClientProtocol
    let accessTokenKey: String

    public init(client: NetworkClientProtocol, accessTokenKey: String) {
        self.client = client
        self.accessTokenKey = accessTokenKey
    }
}
