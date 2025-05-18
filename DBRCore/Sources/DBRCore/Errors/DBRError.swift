import Foundation

public enum DBRError: Error, Equatable {
    case unauthorized
    case conflict
    case notFound
    case invalidRequest(String)
    case serviceUnavailable
    case connection
    case timeout
    case business(message: String)
    case unknown
}

extension DBRError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return NSLocalizedString("unauthorized",
                                     bundle: Bundle.module,
                                     comment: "unauthorized access")
        case .conflict:
            return NSLocalizedString("conflict",
                                     bundle: Bundle.module,
                                     comment: "conflict")
        case .notFound:
            return NSLocalizedString("notFound",
                                     bundle: Bundle.module,
                                     comment: "Not found")
        case .invalidRequest(let error):
            let message = NSLocalizedString(
                "invalidRequest",
                bundle: Bundle.module,
                comment: "Invalid request"
            )

            return "\(message) \(error)"
        case .serviceUnavailable:
            return NSLocalizedString("serviceUnavailable",
                                     bundle: Bundle.module,
                                     comment: "Service unavailable")
        case .connection:
            return NSLocalizedString("connection",
                                     bundle: Bundle.module,
                                     comment: "Connection error")
        case .timeout:
            return NSLocalizedString("timeout",
                                     bundle: Bundle.module,
                                     comment: "Timeout")
        case .business(let error):
            let message = NSLocalizedString(
                "businessError",
                bundle: Bundle.module,
                comment: "Business error"
            )

            return "\(message) \(error)"
        case .unknown:
            return NSLocalizedString("unknownError",
                                     bundle: Bundle.module,
                                     comment: "Unknown error")
        }
    }
}
