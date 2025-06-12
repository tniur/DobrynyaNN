//
//  DBRRegistrationView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 27.03.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRRegistrationView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: DBRRegistrationViewModel
    
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
        .padding(.top, 164.0)
        .padding(.horizontal)
        .padding(.bottom, 32)
    }

    private var inputView: some View {
        VStack(alignment: .center, spacing: 32) {
            Text(String(localized: "signUp"))
                .font(DBRFont.B30)
                .foregroundStyle(DBRColor.base10.swiftUIColor)
            
            VStack {
                DBRTextField(
                    placeholderText: String(localized: "login"),
                    text: $viewModel.login,
                    errorMessage: .constant(viewModel.errorMessage != nil ? "" : nil)
                )
                
                DBRTextField(
                    placeholderText: String(localized: "password"),
                    text: $viewModel.password,
                    isSecure: true,
                    errorMessage: .constant(viewModel.errorMessage != nil ? "" : nil)
                )
                
                DBRTextField(
                    placeholderText: String(localized: "repeatPassword"),
                    text: $viewModel.repeatedPassword,
                    isSecure: true,
                    errorMessage: $viewModel.errorMessage)
            }
        }
    }
    
    private var bottomView: some View {
        VStack(spacing: 24) {
            DBRButton(
                String(localized: "next"),
                style: DBRButtonStyle(.primary),
                action: viewModel.showRegistrationPhone
            )
            .environment(
                \.isEnabled,
                 !viewModel.login.isEmpty && !viewModel.password.isEmpty && !viewModel.repeatedPassword.isEmpty
            )
            
            HStack(spacing: 8) {
                Text(String(localized: "alreadyHaveAnAccount"))
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Button(String(localized: "logIn"), action: viewModel.showLogin)
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    // MARK: - Initializer

    init(viewModel: DBRRegistrationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
