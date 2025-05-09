//
//  DBRServiceTypeView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRServiceTypeView: View {
    
    // MARK: - Properties

    @StateObject var viewModel: DBRServiceTypeViewModel
    
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
                action: viewModel.showAvailableServices
            )
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
                    ForEach(viewModel.serviceTypes, id: \.self) { type in
                        Text(type)
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
                                        viewModel.selectedType == type ? DBRColor.blue6.swiftUIColor : DBRColor.base3.swiftUIColor,
                                        lineWidth: 1.0
                                    )
                            )
                            .onTapGesture {
                                viewModel.typeDidSelected(with: type)
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
}
