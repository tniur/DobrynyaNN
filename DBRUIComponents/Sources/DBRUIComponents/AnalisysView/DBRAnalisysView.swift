//
//  DBRAnalisysView.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 22.05.2025.
//

import SwiftUI

public struct DBRAnalisysView: View {

    // MARK: - Properties

    private let title: String
    private let adress: String
    private let doctorName: String
    private let date: String

    // MARK: - Body

    public var body: some View {
        contentView
    }

    // MARK: - Subviews

    private var contentView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
                .padding(.bottom, 16.0)

            VStack(alignment: .leading, spacing: 8.0) {
                HStack(spacing: 8.0) {
                    DBRImage.houseIcon.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                        .frame(width: 28.0, height: 28.0)

                    Text(adress)
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base7.swiftUIColor)
                        .lineLimit(1)
                }

                HStack(spacing: 8.0) {
                    DBRImage.medChestIcon.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                        .frame(width: 28.0, height: 28.0)

                    Text(doctorName)
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base7.swiftUIColor)
                        .lineLimit(1)
                }

                HStack(spacing: 8.0) {
                    DBRImage.calendarIcon.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                        .frame(width: 28.0, height: 28.0)

                    Text(date)
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base7.swiftUIColor)
                        .lineLimit(1)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20.0)
                .fill(DBRColor.base0.swiftUIColor)
                .shadow(
                    color: DBRColor.base10.swiftUIColor.opacity(0.05),
                    radius: 20,
                    x: 0,
                    y: 2
                )
        )
    }

    // MARK: - Initializer

    private init(
        title: String,
        adress: String,
        doctorName: String,
        date: String
    ) {
        self.title = title
        self.adress = adress
        self.doctorName = doctorName
        self.date = date
    }
    
    public init(_ config: DBRAnalysysViewConfig) {
        self.title = config.title
        self.adress = config.adress
        self.doctorName = config.doctorName
        self.date = config.date
    }
}
