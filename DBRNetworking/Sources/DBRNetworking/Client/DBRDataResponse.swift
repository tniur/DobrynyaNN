import Foundation

public struct DBRDataResponse<Response: Codable>: Codable, @unchecked Sendable {
    public let data: Response
}

extension DBRDataResponse: DBRValidatableResponse where Response: DBRValidatableResponse {
    public var success: Bool { data.success }
    public var message: String { data.message }
}

public protocol DBRValidatableResponse {
    var success: Bool { get }
    var message: String { get }
}
