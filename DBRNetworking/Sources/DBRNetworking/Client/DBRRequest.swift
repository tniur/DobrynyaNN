import Foundation

public struct DBRRequest<Response>: @unchecked Sendable {
    public let method: DBRHTTPMethod
    public let url: URL
    public let path: String
    public let query: [(String, String?)]?
    public let body: Encodable?
    public let headers: [String: String]?

    public init(
        method: DBRHTTPMethod = .get,
        url: URL,
        path: String,
        query: [(String, String?)]? = nil,
        body: Encodable? = nil,
        headers: [String: String]? = nil
    ) {
        self.method = method
        self.url = url
        self.path = path
        self.query = query
        self.body = body
        self.headers = headers
    }
}

public enum DBRHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case put = "PUT"
    case delete = "DELETE"
}
