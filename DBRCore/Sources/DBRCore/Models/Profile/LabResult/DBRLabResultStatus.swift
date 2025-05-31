import Foundation
import SwiftUICore

public enum DBRLabResultStatus: String, Sendable {
    case normal
    case abnormal
    case inProgress
    case unknown

    public init(fromRawValue rawValue: String) {
        switch rawValue {
        case "normal":
            self = .normal
        case "abnormal":
            self = .abnormal
        case "in_progress":
            self = .inProgress
        default:
            self = .unknown
        }
    }

    public var localizedTitle: String {
        switch self {
        case .normal:
            return String(localized: "labResultStatusNormal", bundle: .module)
        case .abnormal:
            return String(localized: "labResultStatusAbnormal", bundle: .module)
        case .inProgress:
            return String(localized: "labResultStatusInProgress", bundle: .module)
        case .unknown:
            return String(localized: "labResultStatusUnknown", bundle: .module)
        }
    }
}
