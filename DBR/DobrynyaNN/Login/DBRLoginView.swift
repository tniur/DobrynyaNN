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

    @State private var login: String = ""
    @State private var password: String = ""
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            inputView
            Spacer()
            bottomView
        }
        .padding(.top, 164.0)
        .padding(.horizontal)
        .padding(.bottom, 32.0)
    }
    
    // MARK: - Subviews

    private var inputView: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("Вход")
                .font(DBRFont.B30)
                .foregroundStyle(DBRColor.base10.swiftUIColor)
            
            VStack {
                DBRTextField(placeholderText: "Логин", text: $login)
                DBRTextField(placeholderText: "Пароль", text: $password, isSecure: true)

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
                action: viewModel.showLoginCode
            )
            .environment(\.isEnabled, true)
            
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

