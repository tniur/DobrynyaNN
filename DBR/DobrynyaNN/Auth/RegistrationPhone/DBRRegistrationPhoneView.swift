//
//  DBRRegistrationPhoneView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.03.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRRegistrationPhoneView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRRegistrationPhoneViewModel
    
    // MARK: - Body
    
    var body: some View {
        DBRBackgroundView {
            contentView
        }
    }
    
    // MARK: - Subviews
    
    private var contentView: some View {
        VStack {
            inputView
            Spacer()
            bottomView
        }
        .padding(.top, 100.0)
        .padding(.horizontal)
        .padding(.bottom, 32)
    }

    private var inputView: some View {
        VStack(alignment: .center, spacing: 32) {
            VStack(spacing: 8) {
                Text(String(localized: "registration"))
                    .font(DBRFont.B30)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Text(String(localized: "enterPhoneNumberAndSendCode"))
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                    .frame(width: 281)
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                DBRTextField(
                    placeholderText: String(localized: "mobileNumber"),
                    text: $viewModel.phoneNumber,
                    errorMessage: $viewModel.errorMessage
                )
                .inputType(.phone)
            }
        }
    }
    
    private var bottomView: some View {
        VStack(spacing: 24) {
            DBRButton(
                String(localized: "getCode"),
                style: DBRButtonStyle(.primary),
                action: viewModel.showRegistrationCode
            )
            .environment(\.isEnabled, !viewModel.phoneNumber.isEmpty)
            
            HStack(spacing: 8) {
                Text(String(localized: "alreadyHaveAnAccount"))
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Button(String("enter"), action: viewModel.showLogin)
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRRegistrationPhoneViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
