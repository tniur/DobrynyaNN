import Foundation
import SwiftUICore
import DBRUIComponents

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

    public var capsuleForegroundColor: Color {
        switch self {
        case .inProgress, .unknown:
            return DBRColor.base4.swiftUIColor
        case .normal:
            return DBRColor.green5.swiftUIColor
        case .abnormal:
            return DBRColor.red5.swiftUIColor
        }
    }

    public var capsuleBackgroundColor: Color {
        switch self {
        case .inProgress, .unknown:
            return DBRColor.base1.swiftUIColor
        case .normal:
            return DBRColor.green2.swiftUIColor
        case .abnormal:
            return DBRColor.red2.swiftUIColor
        }
    }

    public var foregroundColor: Color {
        switch self {
        case .inProgress, .unknown:
            return DBRColor.base3.swiftUIColor
        case .normal, .abnormal:
            return DBRColor.blue3.swiftUIColor
        }
    }

    public var backgroundColor: Color {
        switch self {
        case .inProgress, .unknown:
            return DBRColor.base1.swiftUIColor
        case .normal, .abnormal:
            return DBRColor.blue1.swiftUIColor
        }
    }

    public var textForegroundColor: Color {
        switch self {
        case .inProgress, .unknown:
            return DBRColor.base5.swiftUIColor
        case .normal, .abnormal:
            return DBRColor.blue6.swiftUIColor
        }
    }
}
