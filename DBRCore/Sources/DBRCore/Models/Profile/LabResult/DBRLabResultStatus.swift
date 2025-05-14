import Foundation

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
            return NSLocalizedString("labResultStatusNormal",
                                     bundle: Bundle.module, comment: "Normal")
        case .abnormal:
            return NSLocalizedString("labResultStatusAbnormal",
                                     bundle: Bundle.module, comment: "Abnormal")
        case .inProgress:
            return NSLocalizedString("labResultStatusInProgress",
                                     bundle: Bundle.module, comment: "In progress")
        case .unknown:
            return NSLocalizedString("labResultStatusUnknown",
                                     bundle: Bundle.module, comment: "Unknown")
        }
    }
}
