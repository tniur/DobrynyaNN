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
            return NSLocalizedString("appointmentStatusUpcoming",
                                     bundle: Bundle.module, comment: "Upcoming")
        case .completed:
            return NSLocalizedString("appointmentStatusCompleted",
                                     bundle: Bundle.module, comment: "Completed")
        case .refused:
            return NSLocalizedString("appointmentStatusRefused",
                                     bundle: Bundle.module, comment: "Refused")
        case .unknown:
            return NSLocalizedString("appointmentStatusUnknown",
                                     bundle: Bundle.module, comment: "Unknown")
        }
    }
}
