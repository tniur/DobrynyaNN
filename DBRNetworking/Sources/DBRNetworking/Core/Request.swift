import Foundation

public struct Request<Response> {
    public let method: HTTPMethod
    public let path: String
    public let query: [String: String]?
    public let body: Encodable?

    public init(
        method: HTTPMethod = .get,
        path: String,
        query: [String: String]? = nil,
        body: Encodable? = nil
    ) {
        self.method = method
        self.path = path
        self.query = query
        self.body = body
    }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
