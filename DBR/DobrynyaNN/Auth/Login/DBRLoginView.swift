//
//  DBRLoginView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRLoginView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: DBRLoginViewModel
    
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
        .padding(.bottom, 32.0)
    }

    private var inputView: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("Вход")
                .font(DBRFont.B30)
                .foregroundStyle(DBRColor.base10.swiftUIColor)
            
            VStack(alignment: .leading) {
                DBRTextField(
                    placeholderText: "Логин",
                    text: $viewModel.login,
                    errorMessage: .constant(viewModel.errorMessage != nil ? "" : nil)
                )
                
                DBRTextField(
                    placeholderText: "Пароль",
                    text: $viewModel.password,
                    isSecure: true,
                    errorMessage: $viewModel.errorMessage
                )
                
                HStack {
                    Spacer()
                    Button("Забыли пароль?", action: { })
                        .font(DBRFont.R14)
                        .foregroundStyle(DBRColor.base10.swiftUIColor)
                        .padding(.horizontal, 8)
                        .frame(height: 30)
                }
            }
        }
    }
    
    private var bottomView: some View {
        VStack(spacing: 24) {
            DBRButton(
                "Отправить код",
                style: DBRButtonStyle(.primary),
                action: viewModel.requestCode
            )
            .environment(
                \.isEnabled,
                 !viewModel.login.isEmpty && !viewModel.password.isEmpty
            )
            
            HStack(spacing: 8) {
                Text("Нет аккаунта?")
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Button("Зарегистрироваться", action: viewModel.showRegistration)
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
    
    // MARK: - Initializer
    
    init(viewModel: DBRLoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
