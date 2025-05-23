//
//  DBRClinicAdressesView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 03.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRClinicAdressesView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRClinicAdressesViewModel
    
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
                action: viewModel.showSpecialists
            )
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 32.0) {
                DBRSegmentedProgressView(progress: 3, totalSegments: 5)

                Text("Филиалы")
                    .font(DBRFont.R20)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
                
                LazyVStack(spacing: 16.0) {
                    ForEach(viewModel.adresses, id: \.self) { adress in
                        Text(adress)
                            .font(DBRFont.R14)
                            .foregroundStyle(DBRColor.base10.swiftUIColor)
                            .padding()
                            .frame(height: 60.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                Capsule()
                                    .fill(DBRColor.base0.swiftUIColor)
                            )
                            .overlay(
                                Capsule()
                                    .stroke(
                                        viewModel.selectedAdress == adress ? DBRColor.blue6.swiftUIColor : DBRColor.base3.swiftUIColor,
                                        lineWidth: 1.0
                                    )
                            )
                            .onTapGesture {
                                viewModel.selectedAdress = adress
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
            Text("Нет доступных филиалов")
                .font(DBRFont.R20)
                .foregroundStyle(DBRColor.blue6.swiftUIColor)
            
            Text("В настоящий момент филиалы для данной услуги недоступны. Попробуйте вернуться и выбрать другую услугу.")
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRClinicAdressesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
