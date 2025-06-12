//
//  DBRSignUpServiceView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 28.04.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRSignUpServiceView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRSignUpServiceViewModel
    
    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
                .navigationTitle(String(localized: "signUpForService"))
                .padding()
        }
    }
    
    // MARK: - Subviews

    private var contentView: some View {
        VStack(spacing: .zero) {
            DBRImage.servicePlaceholder.swiftUIImage
                .resizable()
                .frame(width: 300.0, height: 300.0)
                .padding(.bottom, 32.0)
            
            Text(String(localized: "quickEasyWayBookAppointment"))
                .font(DBRFont.R14)
                .foregroundStyle(DBRColor.base7.swiftUIColor)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .padding(.bottom, 16.0)
            
            DBRButton(
                String(localized: "startRecording"),
                style: DBRButtonStyle(.primary),
                action: viewModel.showServiceType
            )
            
            Spacer()
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRSignUpServiceViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
