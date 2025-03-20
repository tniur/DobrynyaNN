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

    @State private var login: String = ""
    @State private var password: String = ""
    
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
            Text("Вход")
                .foregroundStyle(DBRColor.base10.swiftUIColor)
            
            VStack {
                DBRTextField(placeholderText: "Логин", text: $login)
                DBRTextField(placeholderText: "Пароль", text: $password, isSecure: true)

                HStack {
                    Spacer()
                    Button("Забыли пароль?", action: { })
                        .foregroundStyle(DBRColor.base10.swiftUIColor)
                        .padding(.horizontal, 8)
                        .frame(height: 30)
                }
            }
        }
    }
    
    private var bottomView: some View {
        VStack(spacing: 24) {
            DBRButton("Отправить код", style: DBRButtonStyle(.primary), action: { })
                .environment(\.isEnabled, true)

            HStack(spacing: 8) {
                Text("Нет аккаунта?")
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                
                Button("Зарегистрироваться", action: { })
                    .foregroundStyle(DBRColor.blue6.swiftUIColor)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    DBRLoginView()
}
