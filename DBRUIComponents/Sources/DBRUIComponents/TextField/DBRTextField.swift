//
//  DBRTextField.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

public struct DBRTextField: View {

    // MARK: - Properties

    @Binding var text: String
    @Binding var errorMessage: String?

    @State private var isSecure: Bool
    @State private var isVisible: Bool = false

    @FocusState private var isFocused: Bool

    @Environment(\.inputType)
    private var inputType: DBRInputType
    private let placeholderText: String

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            contentView
                .onTapGesture {
                    isFocused = true
                }

            if let errorMessage, !errorMessage.isEmpty {
                makeErrorView(with: errorMessage)
            }
        }
    }

    private var contentView: some View {
        Group {
            if isSecure {
                secureTextField
            } else {
                TextField(placeholderText, text: $text)
                    .focused($isFocused)
                    .font(DBRFont.R14)
                    .autocorrectionDisabled(false)
                    .textInputAutocapitalization(.never)
                    .keyboardType(inputType == .phone ? .phonePad : .default)
                    .foregroundStyle(
                        isFocused || !text.isEmpty ? DBRColor.base10.swiftUIColor : DBRColor.base3.swiftUIColor
                    )
                    .onChange(of: text) { newValue in
                        text = newValue.formatUserInput(type: inputType)
                    }
            }
        }
        .frame(height: 34)
        .padding(.leading)
        .padding(.vertical)
        .padding(.trailing, 20)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(DBRColor.base0.swiftUIColor)
                .frame(height: 56)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    errorMessage != nil ? DBRColor.red6.swiftUIColor : DBRColor.base3.swiftUIColor,
                    lineWidth: 1
                )
                .frame(height: 56)
        }
    }

    private var secureTextField: some View {
        HStack(spacing: 8) {
            if !isVisible {
                SecureField(placeholderText, text: $text)
                    .focused($isFocused)
                    .font(DBRFont.R14)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(inputType == .phone ? .phonePad : .default)
                    .foregroundStyle(
                        isFocused || !text.isEmpty ? DBRColor.base10.swiftUIColor : DBRColor.base3.swiftUIColor
                    )
                    .onChange(of: text) { newValue in
                        text = newValue.formatUserInput(type: inputType)
                    }
            } else {
                TextField(placeholderText, text: $text)
                    .focused($isFocused)
                    .font(DBRFont.R14)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(inputType == .phone ? .phonePad : .default)
                    .foregroundStyle(
                        isFocused || !text.isEmpty ? DBRColor.base10.swiftUIColor : DBRColor.base3.swiftUIColor
                    )
                    .onChange(of: text) { newValue in
                        text = newValue.formatUserInput(type: inputType)
                    }
            }

            Spacer()

            Image(systemName: isVisible ? "eye.slash" : "eye")
                .renderingMode(.template)
                .foregroundColor(DBRColor.base5.swiftUIColor)
                .onTapGesture {
                    isVisible.toggle()
                }
        }
    }

    // MARK: - Initializer

    public init(
        placeholderText: String,
        text: Binding<String>,
        isSecure: Bool = false,
        errorMessage: Binding<String?> = .constant(nil)
    ) {
        self.placeholderText = placeholderText
        self._text = text
        self.isSecure = isSecure
        self._errorMessage = errorMessage
    }

    // MARK: - Methods

    private func makeErrorView(with errorMessage: String) -> some View {
        Text(errorMessage)
            .font(DBRFont.R14)
            .foregroundStyle(DBRColor.red6.swiftUIColor)
            .transition(.opacity)
    }
}
