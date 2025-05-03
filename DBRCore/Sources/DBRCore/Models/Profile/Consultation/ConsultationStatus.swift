import Foundation

public enum ConsultationStatus: String, Sendable {
    case waiting
    case active
    case done
    case unknown

    public init(fromRawValue rawValue: String) {
        self = ConsultationStatus(rawValue: rawValue) ?? .unknown
    }

    public var localizedTitle: String {
        switch self {
        case .waiting:
            return NSLocalizedString("consultationStatusWaiting",
                                     bundle: Bundle.module, comment: "Waiting")
        case .active:
            return NSLocalizedString("consultationStatusActive",
                                     bundle: Bundle.module, comment: "Active")
        case .done:
            return NSLocalizedString("consultationStatusDone",
                                     bundle: Bundle.module, comment: "Done")
        case .unknown:
            return NSLocalizedString("consultationStatusUnknown",
                                     bundle: Bundle.module, comment: "Unknown")
        }
    }
}
