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
    case secondaryRed
    case tertiary
    case tertiaryRed

    public var backgroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            DBRColor.blue6.swiftUIColor
        case .secondary, .secondaryRed:
            DBRColor.base0.swiftUIColor
        case .tertiary, .tertiaryRed:
            .clear
        }
    }

    public var foregroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            DBRColor.base0.swiftUIColor
        case .secondary:
            DBRColor.base7.swiftUIColor
        case .secondaryRed:
            DBRColor.red6.swiftUIColor
        case .tertiary:
            DBRColor.base10.swiftUIColor
        case .tertiaryRed:
            DBRColor.red6.swiftUIColor
        }
    }

    public var strokeColor: SwiftUI.Color {
        switch self {
        case .primary, .tertiary, .tertiaryRed:
            .clear
        case .secondary:
            DBRColor.base3.swiftUIColor
        case .secondaryRed:
            DBRColor.red6.swiftUIColor
        }
    }

    public var pressedBackgroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            DBRColor.blue8.swiftUIColor
        case .secondary, .secondaryRed:
            DBRColor.base0.swiftUIColor
        case .tertiary, .tertiaryRed:
            .clear
        }
    }

    public var pressedForegroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            DBRColor.base0.swiftUIColor
        case .secondary, .tertiary:
            DBRColor.base7.swiftUIColor
        case .secondaryRed, .tertiaryRed:
            DBRColor.red8.swiftUIColor
        }
    }

    public var pressedStrokeColor: SwiftUI.Color {
        switch self {
        case .primary, .tertiary, .tertiaryRed:
            .clear
        case .secondary:
            DBRColor.base7.swiftUIColor
        case .secondaryRed:
            DBRColor.red8.swiftUIColor
        }
    }

    public var disabledBackgroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            DBRColor.blue3.swiftUIColor
        case .secondary, .secondaryRed:
            DBRColor.base0.swiftUIColor
        case .tertiary, .tertiaryRed:
            .clear
        }
    }

    public var disabledForegroundColor: SwiftUI.Color {
        switch self {
        case .primary:
            DBRColor.base0.swiftUIColor
        case .secondary, .tertiary:
            DBRColor.base3.swiftUIColor
        case .secondaryRed, .tertiaryRed:
            DBRColor.red3.swiftUIColor
        }
    }

    public var disabledStrokeColor: SwiftUI.Color {
        switch self {
        case .primary, .tertiary, .tertiaryRed:
            .clear
        case .secondary:
            DBRColor.base3.swiftUIColor
        case .secondaryRed:
            DBRColor.red3.swiftUIColor
        }
    }

    public var strokeWidth: CGFloat {
        switch self {
        case .primary, .tertiary, .tertiaryRed:
            .zero
        case .secondary, .secondaryRed:
            1.0
        }
    }
}
