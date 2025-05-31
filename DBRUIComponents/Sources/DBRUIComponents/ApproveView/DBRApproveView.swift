//
//  DBRApproveView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 31.05.2025.
//

import SwiftUI

public struct DBRApproveView: View {

    // MARK: - Constants

    private enum Constant {
        static let cancelButtonTitle = String(localized: "Cancel", bundle: .module)
        static let approveButtonTitle = String(localized: "Approve", bundle: .module)
        static let height: CGFloat = 180.0
        static let titleBPadding: CGFloat = 8.0
        static let descriptionBPadding: CGFloat = 32.0
        static let buttonsSpacing: CGFloat = 8.0
    }
    
    // MARK: - Properties

    private let title: String
    private let description: String
    private let cancelAction: () -> Void
    private let approveAction: () -> Void

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
                .font(DBRFont.M20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
                .padding(.bottom, Constant.titleBPadding)

            Text(description)
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
                .padding(.bottom, Constant.descriptionBPadding)

            HStack(spacing: Constant.buttonsSpacing) {
                DBRButton(
                    Constant.cancelButtonTitle,
                    style: .init(.secondaryRed),
                    action: cancelAction
                )

                DBRButton(
                    Constant.approveButtonTitle,
                    style: .init(.primary),
                    action: approveAction
                )
            }
        }
        .background(
            DBRColor.base0.swiftUIColor
        )
        .padding()
        .presentationDetents([.height(Constant.height)])
    }

    // MARK: - Initializer

    public init(
        title: String,
        description: String,
        cancelAction: @escaping () -> Void,
        approveAction: @escaping () -> Void
    ) {
        self.title = title
        self.description = description
        self.cancelAction = cancelAction
        self.approveAction = approveAction
    }
}
