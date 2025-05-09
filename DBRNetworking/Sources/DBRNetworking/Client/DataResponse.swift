import Foundation

public struct DataResponse<Response: Codable>: Codable, @unchecked Sendable {
    public let data: Response
}

extension DataResponse: ValidatableResponse where Response: ValidatableResponse {
    public var success: Bool { data.success }
    public var message: String { data.message }
}

public protocol ValidatableResponse {
    var success: Bool { get }
    var message: String { get }
}
