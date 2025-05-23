//
//  DBRSpecialistsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 04.05.2025.
//


import SwiftUI
import DBRUIComponents

struct DBRSpecialistsView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRSpecialistsViewModel
    
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
                action: viewModel.showTimeSlots
            )
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 32.0) {
                DBRSegmentedProgressView(progress: 4, totalSegments: 5)

                Text("Специалисты")
                    .font(DBRFont.R20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                
                LazyVStack(spacing: 16.0) {
                    ForEach(viewModel.specialists) { specialist in
                        HStack(spacing: 16.0) {
                            DBRImage.avatarPlaceholder.swiftUIImage
                                .resizable()
                                .frame(width: 80.0, height: 80.0)
                            
                            VStack(alignment: .leading, spacing: 4.0) {
                                Text(specialist.name)
                                    .font(DBRFont.B16)
                                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                                
                                Text(specialist.speciality)
                                    .font(DBRFont.R12)
                                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                            }
                        }
                        .padding()
                        .frame(height: 120.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 20.0)
                                .fill(DBRColor.base0.swiftUIColor)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20.0)
                                .stroke(
                                    viewModel.selectedSpecialist?.id == specialist.id ? DBRColor.blue6.swiftUIColor : DBRColor.base3.swiftUIColor,
                                    lineWidth: 1.0
                                )
                        )
                        .onTapGesture {
                            viewModel.selectedSpecialist = specialist
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 84.0)
        }
        .scrollIndicators(.hidden)
    }
    
    private var emptyView: some View {
        VStack(spacing: 8.0) {
            Text("Специалисты недоступны")
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            
            Text("На данный момент отсутствуют специалисты для оказания этой услуги. Пожалуйста, выберите другую услугу или обратитесь в клинику.")
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRSpecialistsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
