import Foundation
import DBRNetworking
import DBRCore

struct DBRNetworkErrorMapper {
    static func map(_ error: DBRNetworkError) -> DBRError {
        switch error {
        case .unauthorized:
            return .unauthorized

        case .notFound:
            return .notFound

        case .badRequest(let response):
            return .invalidRequest(response.detail)

        case .badRequestCode(let code):
            return .invalidRequest("\(code)")

        case .noConnected, .connectionLost:
            return .connection

        case .connectionTimeout:
            return .timeout

        case .serviceUnavailable:
            return .serviceUnavailable

        case .businessLogicError(let message):
            return .business(message: message)

        case .decodingError, .invalidServerResponse, .invalidURL,
            .unexpectedResponseBody, .errorResponse, .unknown:
            return .unknown
        }
    }
}
