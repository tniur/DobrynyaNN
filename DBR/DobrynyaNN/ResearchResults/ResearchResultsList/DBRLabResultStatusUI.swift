//
//  DBRLabResultStatusUI.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 31.05.2025.
//

import Foundation
import SwiftUICore
import DBRUIComponents
import DBRCore

public struct DBRLabResultStatusUI: Sendable {
   
    private let labResultStatus: DBRLabResultStatus

    public let localizedTitle: String

    public var capsuleForegroundColor: Color {
        switch labResultStatus {
        case .inProgress, .unknown:
            return DBRColor.base4.swiftUIColor
        case .normal:
            return DBRColor.green5.swiftUIColor
        case .abnormal:
            return DBRColor.red5.swiftUIColor
        }
    }

    public var capsuleBackgroundColor: Color {
        switch labResultStatus {
        case .inProgress, .unknown:
            return DBRColor.base1.swiftUIColor
        case .normal:
            return DBRColor.green2.swiftUIColor
        case .abnormal:
            return DBRColor.red2.swiftUIColor
        }
    }

    public var foregroundColor: Color {
        switch labResultStatus {
        case .inProgress, .unknown:
            return DBRColor.base3.swiftUIColor
        case .normal, .abnormal:
            return DBRColor.base3.swiftUIColor
        }
    }

    public var backgroundColor: Color {
        switch labResultStatus {
        case .inProgress, .unknown:
            return DBRColor.base1.swiftUIColor
        case .normal, .abnormal:
            return DBRColor.base0.swiftUIColor
        }
    }

    public var textForegroundColor: Color {
        switch labResultStatus {
        case .inProgress, .unknown:
            return DBRColor.base5.swiftUIColor
        case .normal, .abnormal:
            return DBRColor.blue6.swiftUIColor
        }
    }
    
    public init(from labResultStatus: DBRLabResultStatus) {
        self.labResultStatus = labResultStatus
        self.localizedTitle = labResultStatus.localizedTitle
    }
}
