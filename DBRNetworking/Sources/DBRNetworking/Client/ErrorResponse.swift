import Foundation

public struct ErrorResponse: Decodable, Error {
    let detail: String
}
