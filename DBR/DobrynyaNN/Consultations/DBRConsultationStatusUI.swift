//
//  DBRConsultationStatusUI.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.06.2025.
//

import Foundation
import SwiftUICore
import DBRUIComponents
import DBRCore

public struct DBRConsultationStatusUI: Sendable {
   
    private let consultationStatus: DBRConsultationStatus

    public let localizedTitle: String

    var capsuleForegroundColor: Color {
        switch consultationStatus {
        case .active:
            return DBRColor.green5.swiftUIColor
        case .waiting:
            return DBRColor.orange4.swiftUIColor
        case .done, .unknown:
            return DBRColor.base4.swiftUIColor
        }
    }
    
    var capsuleBackgroundColor: Color {
        switch consultationStatus {
        case .active:
            return DBRColor.green2.swiftUIColor
        case .waiting:
            return DBRColor.orange2.swiftUIColor
        case .done, .unknown:
            return DBRColor.base1.swiftUIColor
        }
    }
    
    public init(from consultationStatus: DBRConsultationStatus) {
        self.consultationStatus = consultationStatus
        self.localizedTitle = consultationStatus.localizedTitle
    }
}
