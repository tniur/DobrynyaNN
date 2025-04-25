//
//  DBRResultState.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import SwiftUI
import DBRUIComponents

public enum DBRResultState {
    case inProcess
    case success
    case deviations
    
    var title: String {
        switch self {
        case .inProcess:
            return "В процессе"
        case .success:
            return "В норме"
        case .deviations:
            return "Есть отклонения"
        }
    }
    
    var capsuleForegroundColor: Color {
        switch self {
        case .inProcess:
            return DBRColor.base4.swiftUIColor
        case .success:
            return DBRColor.green5.swiftUIColor
        case .deviations:
            return DBRColor.red5.swiftUIColor
        }
    }
    
    var capsuleBackgroundColor: Color {
        switch self {
        case .inProcess:
            return DBRColor.base1.swiftUIColor
        case .success:
            return DBRColor.green2.swiftUIColor
        case .deviations:
            return DBRColor.red2.swiftUIColor
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .inProcess:
            return DBRColor.base3.swiftUIColor
        case .success, .deviations:
            return DBRColor.blue3.swiftUIColor
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .inProcess:
            return DBRColor.base1.swiftUIColor
        case .success, .deviations:
            return DBRColor.blue1.swiftUIColor
        }
    }
    
    var textForegroundColor: Color {
        switch self {
        case .inProcess:
            return DBRColor.base5.swiftUIColor
        case .success, .deviations:
            return DBRColor.blue6.swiftUIColor
        }
    }
}
