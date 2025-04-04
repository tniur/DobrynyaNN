//
//  DBRButtonStyle.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

public struct DBRButtonStyle: ButtonStyle {

    // MARK: - Constants

    private enum Constant {
        static let defaultCornerRadius = 16.0
        static let fullRoundedCornerRadius = 29.0
        static let height = 58.0
    }

    // MARK: - Properties

    private let type: DBRButtonType
    @Environment(\.isEnabled)
    private var isEnabled
    private let fullRounded: Bool

    // MARK: - Initializer

    public init(_ type: DBRButtonType, fullRounded: Bool = false) {
        self.type = type
        self.fullRounded = fullRounded
    }

    // MARK: - Methods

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(DBRFont.R16)
            .frame(maxWidth: .infinity)
            .frame(height: Constant.height)
            .foregroundStyle(isEnabled ? (configuration.isPressed ? type.pressedForegroundColor : type.foregroundColor) : type.disabledForegroundColor)
            .background {
                RoundedRectangle(cornerRadius: fullRounded ? Constant.fullRoundedCornerRadius : Constant.defaultCornerRadius)
                    .fill(isEnabled ? (configuration.isPressed ? type.pressedBackgroundColor : type.backgroundColor) : type.disabledBackgroundColor)
            }
            .overlay {
                RoundedRectangle(cornerRadius: fullRounded ? Constant.fullRoundedCornerRadius : Constant.defaultCornerRadius)
                    .stroke(isEnabled ? (configuration.isPressed ? type.pressedStrokeColor : type.strokeColor) : type.disabledStrokeColor, lineWidth: type.strokeWidth)
            }
    }
}
