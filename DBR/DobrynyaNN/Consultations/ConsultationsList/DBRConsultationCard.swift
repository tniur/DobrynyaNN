//
//  DBRConsultationCard.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.06.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRConsultationCard: View {
    
    // MARK: - Properties

    private let title: String
    private let doctor: String
    private let status: DBRConsultationStatusUI
    
    // MARK: - Body

    var body: some View {
        contentView
            .padding(.vertical)
            .padding(.leading, 24.0)
            .padding(.trailing)
            .background(
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(DBRColor.base3.swiftUIColor, lineWidth: 1.0)
            )
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: .zero) {
                Text(title)
                    .font(DBRFont.M20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                    .padding(.bottom, 6.0)
                
                HStack(alignment: .center, spacing: 8.0) {
                    DBRImage.medChestIcon.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(DBRColor.blue6.swiftUIColor)
                        .frame(width: 28.0, height: 28.0)
                    
                    Text(doctor)
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base7.swiftUIColor)
                }
                .padding(.bottom, 12.0)
               
                Text(status.localizedTitle)
                    .font(DBRFont.B12)
                    .foregroundStyle(status.capsuleForegroundColor)
                    .padding(.horizontal, 8.0)
                    .padding(.vertical, 4.0)
                    .frame(height: 24.0)
                    .background(
                        Capsule()
                            .fill(status.capsuleBackgroundColor)
                    )
                    .overlay(
                        Capsule()
                            .stroke(
                                status.capsuleForegroundColor,
                                lineWidth: 1.0
                            )
                    )
            }
            
            Spacer()
            
            DBRImage.chevronForwardIcon.swiftUIImage
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(DBRColor.base3.swiftUIColor)
                .frame(width: 24.0, height: 24.0)
        }
    }
    
    // MARK: - Initializer

    init(title: String, doctor: String, status: DBRConsultationStatusUI) {
        self.title = title
        self.doctor = doctor
        self.status = status
    }
}
