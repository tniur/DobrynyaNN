//
//  DBRCodeView.swift
//  DobrynyaNN
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
            static let size = CGSize(width: 46.0, height: 56.0)
            static let cornerRadius = 12.0
            static let spacing = 16.0
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
                    .font(Font.system(size: 20))
                    .frame(width: Constant.InputFieldView.size.width, height: Constant.InputFieldView.size.height)
                    .background {
                        RoundedRectangle(cornerRadius: Constant.InputFieldView.cornerRadius)
                            .stroke(lineWidth: Constant.InputFieldView.strokeWidth)
                            .fill(isError ? .red : .gray)
                    }
            }
        }
    }
    
    private var incorrectCodeView: some View {
        Text("Неверный код подтверждения")
            .foregroundColor(.red)
            .font(Font.system(size: 16))
            .transition(.opacity)
    }
    
    // MARK: - Methods
    
    private func character(at index: Int) -> String {
        guard index < code.count else { return "" }
        let charIndex = code.index(code.startIndex, offsetBy: index)
        return String(code[charIndex])
    }
}
