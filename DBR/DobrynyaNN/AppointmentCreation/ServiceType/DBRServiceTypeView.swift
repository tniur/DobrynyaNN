//
//  DBRServiceTypeView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import SwiftUI
import DBRCore
import DBRUIComponents

struct DBRServiceTypeView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRServiceTypeViewModel
    
    // MARK: - Body

    var body: some View {
        contentView
            .navigationTitle("Выберите тип услуги")
            .onAppear(perform: viewModel.fetchData)
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 32.0) {
                DBRSegmentedProgressView(progress: 1, totalSegments: 5)
                    .padding(.horizontal)

                if viewModel.isLoading {
                    Spacer()

                    ProgressView("Загрузка...")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                } else {
                    scrollView
                }
            }
            
            DBRButton(
                "Далее",
                style: .init(.primary),
                action: viewModel.showAvailableServices
            )
            .disabled(viewModel.selectedTypeId == nil)
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 32.0) {
                Text("Типы услуг")
                    .font(DBRFont.R20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                
                LazyVStack(spacing: 16.0) {
                    ForEach(viewModel.serviceTypes) { type in
                        Text(type.title)
                            .font(DBRFont.R14)
                            .foregroundStyle(DBRColor.base10.swiftUIColor)
                            .padding()
                            .frame(height: 50.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                Capsule()
                                    .fill(DBRColor.base0.swiftUIColor)
                            )
                            .overlay(
                                Capsule()
                                    .stroke(
                                        viewModel.selectedTypeId == type.id ? DBRColor.blue6.swiftUIColor : DBRColor.base3.swiftUIColor,
                                        lineWidth: 1.0
                                    )
                            )
                            .onTapGesture {
                                viewModel.typeDidSelected(with: type.id)
                            }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 84.0)
        }
        .scrollIndicators(.hidden)
    }
}
