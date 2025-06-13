//
//  DBRCodeView.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

public struct DBRCodeView: View {

    // MARK: - Constants

    private enum Constant {
        enum HidenTextField {
            static let size = CGSize.zero
            static let opacity = 0.01
        }

        enum InputFieldView {
            static let spacing = 8.0
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

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                hidenTextField
                inputFieldView
            }
            if isError {
                incorrectCodeView
            }
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
                    .font(DBRFont.R14)
                    .foregroundStyle(DBRColor.base10.swiftUIColor)
                    .frame(width: Constant.InputFieldView.size, height: Constant.InputFieldView.size)
                    .background {
                        RoundedRectangle(cornerRadius: Constant.InputFieldView.cornerRadius)
                            .fill(DBRColor.base0.swiftUIColor)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: Constant.InputFieldView.cornerRadius)
                            .stroke(
                                isError ? DBRColor.red6.swiftUIColor : DBRColor.base3.swiftUIColor,
                                lineWidth: Constant.InputFieldView.strokeWidth
                            )
                    }
            }
        }
    }

    private var incorrectCodeView: some View {
        Text(String(localized: "invalidVerificationCode", bundle: .module))
            .foregroundColor(DBRColor.red6.swiftUIColor)
            .font(DBRFont.R14)
            .transition(.opacity)
    }

    public init(
        code: Binding<String>,
        isError: Binding<Bool>,
        isFocused: FocusState<Bool>.Binding,
        length: Int
    ) {
        self._code = code
        self._isError = isError
        self.isFocused = isFocused
        self.length = length
    }

    // MARK: - Methods

    private func character(at index: Int) -> String {
        guard index < code.count else { return "" }
        let charIndex = code.index(code.startIndex, offsetBy: index)
        return String(code[charIndex])
    }
}
