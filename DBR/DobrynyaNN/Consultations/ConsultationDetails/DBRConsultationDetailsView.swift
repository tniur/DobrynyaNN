//
//  DBRConsultationDetailsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 07.06.2025.
//

import SwiftUI
import DBRUIComponents
import DBRCore

struct DBRConsultationDetailsView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRConsultationDetailsViewModel
    
    // MARK: - Body

    var body: some View {
        contentView
            .onAppear {
                viewModel.fetchData()
            }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ScrollView {
            if let details = viewModel.details {
                LazyVStack(alignment: .leading, spacing: 20.0) {
                    if viewModel.isLoading {
                        Spacer()
                        
                        ProgressView("Загрузка...")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                    } else {
                        titleView(with: details)
                        
                        Divider()
                        
                        descriptionView(with: details)
                    }
                }
                .padding()
            }
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRConsultationDetailsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Methods

    private func titleView(with details: DBRConsultationDetails) -> some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text(details.title)
                .font(DBRFont.B30)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 8.0) {
                DBRImage.medChestIcon.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                    .frame(width: 28.0, height: 28.0)
                
                Text(details.doctorName)
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base7.swiftUIColor)
            }
            
            let status = DBRConsultationStatusUI(from: details.status)
            
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
    }
    
    private func descriptionView(with details: DBRConsultationDetails) -> some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text("Результат консультации")
                .font(DBRFont.B16)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
                .multilineTextAlignment(.leading)
            
            Text(details.description)
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
                .multilineTextAlignment(.leading)
        }
    }
}
