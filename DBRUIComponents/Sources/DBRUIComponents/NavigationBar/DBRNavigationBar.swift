//
//  DBRNavigationBar.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 26.04.2025.
//

import SwiftUI

public struct DBRNavigationBar<RightButton: View>: View {

    @Environment(\.dismiss) var dismiss

    private var title: AnyView?
    private var rightButtons: [RightButton]?

    public var body: some View {
        HStack(spacing: 8.0) {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                    .frame(width: 24.0, height: 24.0)
            }

            Spacer()

            if let title {
                title
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
            }

            Spacer()

            HStack {
                if let buttons = rightButtons {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        buttons[index]
                            .frame(width: 24.0, height: 24.0)
                            .padding(.trailing, 16.0)
                    }
                }
            }
        }
        .frame(height: 64.0)
        .padding(.horizontal, 16.0)
    }

    public init(
        title: AnyView? = nil,
        rightButtons: [RightButton]? = nil
    ) {
        self.title = title
        self.rightButtons = rightButtons
    }
}
