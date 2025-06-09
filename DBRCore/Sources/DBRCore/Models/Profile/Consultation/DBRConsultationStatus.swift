import Foundation

public enum DBRConsultationStatus: String, Sendable {
    case waiting
    case active
    case done
    case unknown

    public init(fromRawValue rawValue: String) {
        self = DBRConsultationStatus(rawValue: rawValue) ?? .unknown
    }

    public var localizedTitle: String {
        switch self {
        case .waiting:
            return String(localized: "consultationStatusWaiting", bundle: .module)
        case .active:
            return String(localized: "consultationStatusActive", bundle: .module)
        case .done:
            return String(localized: "consultationStatusDone", bundle: .module)
        case .unknown:
            return String(localized: "consultationStatusUnknown", bundle: .module)
        }
    }
}
