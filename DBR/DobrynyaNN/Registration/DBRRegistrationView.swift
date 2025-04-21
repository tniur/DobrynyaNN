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
        VStack {
            Spacer()
            inputView
            Spacer()
            bottomView
        }
        .padding(.top)
        .padding(.horizontal)
        .padding(.bottom, 32)
    }
    
    // MARK: - Subviews

    private var inputView: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("Регистрация")
                .font(DBRFont.B36)
                .foregroundStyle(DBRColor.base10.swiftUIColor)
            
            VStack {
                DBRTextField(placeholderText: "Логин", text: $viewModel.login)
                DBRTextField(placeholderText: "Пароль", text: $viewModel.password, isSecure: true)
                DBRTextField(placeholderText: "Повторите пароль", text: $viewModel.repeatedPassword, isSecure: true)
            }
        }
    }
    
    private var bottomView: some View {
        VStack(spacing: 24) {
            DBRButton(
                "Дальше",
                style: DBRButtonStyle(.primary),
                action: viewModel.showRegistrationPhone
            )
            .environment(\.isEnabled, true)
            
            HStack(spacing: 8) {
                Text("Уже есть аккаунт?")
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Button("Войти", action: { })
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
