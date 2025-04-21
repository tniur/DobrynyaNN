import Foundation

public struct Request<Response> {
    public let method: HTTPMethod
    public let path: String
    public var query: [(String, String?)]?
    public let body: Encodable?
    public var headers: [String: String]?

    public init(
        method: HTTPMethod = .get,
        path: String,
        query: [(String, String?)]? = nil,
        body: Encodable? = nil,
        headers: [String: String]? = nil
    ) {
        self.method = method
        self.path = path
        self.query = query
        self.body = body
        self.headers = headers
    }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case put = "PUT"
    case delete = "DELETE"
}
