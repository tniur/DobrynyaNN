//
//  DBRResearchResultCard.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 19.04.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRResearchResultCard: View {
    
    // MARK: - Properties

    private let title: String
    private let date: String
    private let result: DBRResultState
    
    // MARK: - Body

    var body: some View {
        contentView
            .padding(.vertical)
            .padding(.leading, 24.0)
            .padding(.trailing)
            .background(
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(result.backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(result.foregroundColor, lineWidth: 1.0)
            )
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: .zero) {
                Text(title)
                    .font(DBRFont.M20)
                    .foregroundStyle(result.textForegroundColor)
                    .padding(.bottom, 6.0)
                Text(date)
                    .font(DBRFont.I12)
                    .foregroundStyle(result.textForegroundColor)
                    .padding(.bottom, 12.0)
                Text(result.title)
                    .font(DBRFont.B12)
                    .foregroundStyle(result.capsuleForegroundColor)
                    .padding(.horizontal, 8.0)
                    .padding(.vertical, 4.0)
                    .frame(height: 24.0)
                    .background(
                        Capsule()
                            .fill(result.capsuleBackgroundColor)
                    )
                    .overlay(
                        Capsule()
                            .stroke(
                                result.capsuleForegroundColor,
                                lineWidth: 1.0
                            )
                    )
            }
            
            Spacer()
            
            DBRImage.chevronForwardIcon.swiftUIImage
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(result.foregroundColor)
                .frame(width: 24.0, height: 24.0)
        }
    }
    
    // MARK: - Initializer

    init(title: String, date: String, result: DBRResultState) {
        self.title = title
        self.date = date
        self.result = result
    }
}
