//
//  DBRButtonType.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

public enum DBRButtonType {
    case primary
    case secondary

    public var backgroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            .blue
        case .secondary:
            .gray
        }
    }

    public var pressedBackgroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            .blue.opacity(0.4)
        case .secondary:
            .gray.opacity(0.4)
        }
    }

    public var foregroundColor: SwiftUI.Color {
        switch self {
        case .primary, .secondary:
            .white
        }
    }

    public var pressedForegroundColor: SwiftUI.Color {
        switch self {
        case .primary, .secondary:
            .white.opacity(0.4)
        }
    }

    public var disabledBackgroundColor: SwiftUI.Color {
        backgroundColor.opacity(0.3)
    }
}
