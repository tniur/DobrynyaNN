//
//  DBRAvailableServicesView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 29.04.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRAvailableServicesView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRAvailableServicesViewModel

    // MARK: - Body

    var body: some View {
        contentView
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ZStack(alignment: .bottom) {
            scrollView
            
            DBRButton(
                "Далее",
                style: .init(.primary),
                action: viewModel.showClinicAdresses
            )
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 32.0) {
                Text("Доступные услуги")
                    .font(DBRFont.R20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                
                LazyVStack(spacing: 16.0) {
                    ForEach(viewModel.services) { service in
                        DBRAvailableServicesCard(
                            service: service,
                            selectedService: $viewModel.selectedService
                        )
                        .onTapGesture {
                            viewModel.selectedService = service
                        }
                    }
                }
            }
            .padding(.top, 32.0)
            .padding(.horizontal)
            .padding(.bottom, 84.0)
        }
        .scrollIndicators(.hidden)
    }
    
    private var emptyView: some View {
        VStack(spacing: 8.0) {
            Text("В данной категории нет услуг")
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            
            Text("К сожалению, сейчас по выбранной категории услуги не найдены. Попробуйте другую категорию или обратитесь в клинику.")
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
        }
    }
}
