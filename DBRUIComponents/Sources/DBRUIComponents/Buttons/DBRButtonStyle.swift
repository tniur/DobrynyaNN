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
        static let cornerRadius = 16.0
        static let height = 58.0
    }

    // MARK: - Properties

    private let type: DBRButtonType
    @Environment(\.isEnabled)
    private var isEnabled

    // MARK: - Initializer

    public init(_ type: DBRButtonType) {
        self.type = type
    }

    // MARK: - Methods

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.system(size: 16, weight: .semibold))
            .frame(maxWidth: .infinity)
            .frame(height: Constant.height)
            .foregroundStyle(configuration.isPressed ? type.pressedForegroundColor : type.foregroundColor)
            .background(isEnabled ? (configuration.isPressed ? type.pressedBackgroundColor : type.backgroundColor) : type.disabledBackgroundColor)
            .clipShape(
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
            )
    }
}
