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

    @State private var isSecure: Bool
    @State private var isVisible: Bool = false
    @FocusState private var isFocused: Bool
    @Environment(\.inputType)
    private var inputType: DBRInputType
    private let placeholderText: String

    // MARK: - Body

    public var body: some View {
        contentView
            .onTapGesture {
                isFocused = true
            }
    }

    private var contentView: some View {
        Group {
            if isSecure {
                secureTextField
            } else {
                TextField(placeholderText, text: $text)
                    .focused($isFocused)
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
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                .frame(height: 56)
        }
    }

    private var secureTextField: some View {
        HStack(spacing: 8) {
            if isVisible {
                SecureField(placeholderText, text: $text)
                    .focused($isFocused)
                    .onChange(of: text) { newValue in
                        text = newValue.formatUserInput(type: inputType)
                    }
            } else {
                TextField(placeholderText, text: $text)
                    .focused($isFocused)
                    .onChange(of: text) { newValue in
                        text = newValue.formatUserInput(type: inputType)
                    }
            }

            Spacer()

            Image(systemName: isVisible ? "eye.slash" : "eye")
                .foregroundColor(.gray)
                .onTapGesture {
                    isVisible.toggle()
                }
        }
    }

    // MARK: - Initializer

    public init(
        placeholderText: String,
        text: Binding<String>,
        isSecure: Bool = false
    ) {
        self.placeholderText = placeholderText
        self._text = text
        self.isSecure = isSecure
    }
}
