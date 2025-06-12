//
//  DBRLoginCodeView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRVerificationCodeView<VM: DBRVerificationCodeViewModelProtocol>: View {
    
    // MARK: - Properties

    @StateObject private var viewModel: VM
    @FocusState private var isFocused: Bool
    
    // MARK: - Body

    var body: some View {
        DBRBackgroundView {
            contentView
        }
    }
    
    // MARK: - Subviews
    
    private var contentView: some View {
        VStack {
            codeInputView
            Spacer()
            DBRButton("Получить новый код", action: { })
        }
        .padding(.top, 100.0)
        .padding(.horizontal)
        .padding(.bottom)
        .onAppear {
            isFocused = true
        }
    }

    private var codeInputView: some View {
        VStack(spacing: 32) {
            VStack(spacing: 8) {
                Text("Код из смс")
                    .font(DBRFont.B30)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                Text("Мы отправили вам код подтверждения на номер \(viewModel.phoneNumber).")
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base5.swiftUIColor)
                    .frame(width: 281)
                    .multilineTextAlignment(.center)
            }
            DBRCodeView(code: $viewModel.code, isError: $viewModel.isCodeIncorrect, isFocused: $isFocused, length: viewModel.codeLenght)
        }
    }
    
    // MARK: - Initializer

    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
