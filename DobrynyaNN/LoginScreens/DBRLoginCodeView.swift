//
//  DBRLoginCodeView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRLoginCodeView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel = DBRLoginCodeViewModel()
    @FocusState private var isFocused: Bool
    
    // MARK: - Body

    var body: some View {
        VStack {
            codeInputView
            Spacer()
            DBRButton("Получить новый код", action: { })
        }
        .padding(.top, 100)
        .padding(.horizontal)
        .padding(.bottom)
        .onAppear {
            isFocused = true
        }
    }
    
    // MARK: - Subviews

    private var codeInputView: some View {
        VStack(spacing: 32) {
            VStack(spacing: 8) {
                Text("Код из смс")
                    .font(Font.system(size: 40))
                Text("Мы отправили вам код подтверждения на номер +7 (XXX) XXX 19 90.")
            }
            DBRCodeView(code: $viewModel.code, isError: $viewModel.isCodeIncorrect, isFocused: $isFocused, length: viewModel.codeLenght)
        }
    }
}
