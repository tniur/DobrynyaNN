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
            VStack(spacing: 8) {
                Text("Регистрация")
                    .font(DBRFont.B36)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Text("Введите ваш номер телефона, и мы отправим код подтверждения")
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                    .frame(width: 281)
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                DBRTextField(placeholderText: "Мобильный номер", text: $viewModel.phoneNumber)
                    .inputType(.phone)
            }
        }
    }
    
    private var bottomView: some View {
        VStack(spacing: 24) {
            DBRButton(
                "Получить код",
                style: DBRButtonStyle(.primary),
                action: { }
            )
            .environment(\.isEnabled, !viewModel.phoneNumber.isEmpty)
            
            HStack(spacing: 8) {
                Text("Уже есть аккаунт?")
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Button("Войти", action: viewModel.showLoginCode)
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
