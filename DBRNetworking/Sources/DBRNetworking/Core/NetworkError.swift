import Foundation

enum NetworkError: Error {
    case invalidURL
    case unacceptableStatusCode(Int)
    case decodingError(Error)
    case serverError(message: String)
    case unknown(Error)
}
