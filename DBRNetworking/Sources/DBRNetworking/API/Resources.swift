import Foundation

public struct DataResponse<Response: Codable>: Codable, @unchecked Sendable {
    public let data: Response
}

public enum Resources {}
