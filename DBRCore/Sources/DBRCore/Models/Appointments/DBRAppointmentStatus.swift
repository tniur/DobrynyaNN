import Foundation

public enum DBRAppointmentStatus: String, Sendable {
    case upcoming
    case completed
    case refused
    case unknown

    public init(fromRawValue rawValue: String) {
        self = DBRAppointmentStatus(rawValue: rawValue) ?? .unknown
    }

    public var localizedTitle: String {
        switch self {
        case .upcoming:
            return String(localized: "appointmentStatusUpcoming", bundle: .module)
        case .completed:
            return String(localized: "appointmentStatusCompleted", bundle: .module)
        case .refused:
            return String(localized: "appointmentStatusRefused", bundle: .module)
        case .unknown:
            return String(localized: "appointmentStatusUnknown", bundle: .module)
        }
    }
}
