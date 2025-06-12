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
        contentView
            .background(DBRColor.base0.swiftUIColor)
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
                Text("Регистрация")
                    .font(DBRFont.B30)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Text("Введите ваш номер телефона, и мы отправим код подтверждения")
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                    .frame(width: 281)
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                DBRTextField(
                    placeholderText: "Мобильный номер",
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
                "Получить код",
                style: DBRButtonStyle(.primary),
                action: viewModel.showRegistrationCode
            )
            .environment(\.isEnabled, !viewModel.phoneNumber.isEmpty)
            
            HStack(spacing: 8) {
                Text("Уже есть аккаунт?")
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Button("Войти", action: viewModel.showLogin)
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
