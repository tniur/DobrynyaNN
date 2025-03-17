//
//  DBRCodeView.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

struct DBRCodeView: View {

    // MARK: - Constants

    private enum Constant {
        enum HidenTextField {
            static let size = CGSize.zero
            static let opacity = 0.01
        }

        enum InputFieldView {
            static let spacing = 8.0
            static let font = SwiftUI.Font.system(size: 24)
            static let size = 52.0
            static let cornerRadius = 16.0
            static let strokeWidth = 1.0
        }
    }

    // MARK: - Properties

    @Binding var code: String
    @Binding var isError: Bool

    var isFocused: FocusState<Bool>.Binding
    let length: Int

    // MARK: - Body

    var body: some View {
        ZStack {
            hidenTextField
            inputFieldView
        }
    }

    // MARK: - Subviews

    private var hidenTextField: some View {
        TextField("", text: $code)
            .focused(isFocused)
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .foregroundColor(.clear)
            .accentColor(.clear)
            .opacity(Constant.HidenTextField.opacity)
            .frame(
                width: Constant.HidenTextField.size.width,
                height: Constant.HidenTextField.size.height
            )
            .onChange(of: code) { newValue in
                if newValue.count > length {
                    code = String(newValue.prefix(length))
                }
            }
    }

    private var inputFieldView: some View {
        HStack(spacing: Constant.InputFieldView.spacing) {
            ForEach(0..<length, id: \.self) { index in
                Text(character(at: index))
                    .font(Font.system(size: 20))
                    .frame(width: Constant.InputFieldView.size, height: Constant.InputFieldView.size)
                    .background(isError ? .red : .white)
                    .clipShape(.rect(cornerRadius: Constant.InputFieldView.cornerRadius))
            }
        }
    }

    // MARK: - Methods

    private func character(at index: Int) -> String {
        guard index < code.count else { return "" }
        let charIndex = code.index(code.startIndex, offsetBy: index)
        return String(code[charIndex])
    }
}
