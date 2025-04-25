//
//  DBRButton.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

public struct DBRButton<Label: View>: View {

    // MARK: - Properties

    private let action: () -> Void
    private let label: () -> Label
    private let style: DBRButtonStyle
    @Environment(\.isEnabled)
    private var isEnabled

    // MARK: - Body

    public var body: some View {
        Button( action: action, label: label)
            .buttonStyle(style)
            .disabled(!isEnabled)
    }

    // MARK: - Initialzer

    public init(
        style: DBRButtonStyle = .init(.primary),
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.action = action
        self.label = label
        self.style = style
    }
}

// MARK: - Label == Text

public extension DBRButton where Label == Text {

    init(
        _ titleKey: String,
        style: DBRButtonStyle = .init(.primary),
        action: @escaping () -> Void
    ) {
        self.init(style: style, action: action) {
            Text(titleKey)
        }
    }

    init(
        _ titleKey: LocalizedStringKey,
        style: DBRButtonStyle = .init(.primary),
        action: @escaping () -> Void
    ) {
        self.init(style: style, action: action) {
            Text(titleKey)
        }
    }
}

// MARK: - Label == AnyView

public extension DBRButton where Label == AnyView {

    init(
        _ titleKey: String,
        icon: Image,
        action: @escaping () -> Void
    ) {
        self.init(style: .init(.secondary, fullRounded: true), action: action) {
            AnyView(
                HStack(spacing: 8) {
                    icon
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                    Text(titleKey)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.base3.swiftUIColor)
                }
                .padding()
            )
        }
    }

    init(
        _ titleKey: LocalizedStringKey,
        icon: Image,
        action: @escaping () -> Void
    ) {
        self.init(style: .init(.secondary, fullRounded: true), action: action) {
            AnyView(
                HStack(spacing: 8) {
                    icon
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                    Text(titleKey)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.base3.swiftUIColor)
                }
                .padding()
            )
        }
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 16) {
        DBRButton("Enabled Primary", action: {})
            .environment(\.isEnabled, true)
        DBRButton("Disabled Primary", action: {})
            .environment(\.isEnabled, false)
        DBRButton("Enabled Secondary", style: .init(.secondary), action: {})
            .environment(\.isEnabled, true)
        DBRButton("Disabled Secondary", style: .init(.secondary), action: {})
            .environment(\.isEnabled, false)
    }
    .padding()
}
