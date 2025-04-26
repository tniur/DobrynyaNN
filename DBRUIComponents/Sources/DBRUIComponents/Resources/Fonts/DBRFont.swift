//
//  DBRFont.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 20.03.2025.
//

import SwiftUI
import UIKit

public enum DBRFont {

    public static let B30 = Font.custom("Mulish-Bold", size: 30)
    public static let B16 = Font.custom("Mulish-Bold", size: 16)
    public static let B14 = Font.custom("Mulish-Bold", size: 14)
    public static let B12 = Font.custom("Mulish-Bold", size: 12)

    public static let M20 = Font.custom("Mulish-Medium", size: 20)

    public static let R16 = Font.custom("Mulish-Regular", size: 16)
    public static let R14 = Font.custom("Mulish-Regular", size: 14)
    public static let R12 = Font.custom("Mulish-Regular", size: 12)

    public static let I16 = Font.custom("Mulish-Italic", size: 16)
    public static let I14 = Font.custom("Mulish-Italic", size: 14)
    public static let I12 = Font.custom("Mulish-Italic", size: 12)

    public static func registerFonts() {
        let fontNames = [
            "Mulish-Bold",
            "Mulish-Medium",
            "Mulish-Regular",
            "Mulish-Italic"
        ]

        for fontName in fontNames {
            registerFont(named: fontName)
        }
    }

    private static func registerFont(named name: String) {
        guard
            let fontURL = Bundle.module.url(forResource: name, withExtension: "ttf"),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider)
        else {
            print("Не удалось загрузить шрифт \(name)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Ошибка регистрации шрифта \(name): \(error.debugDescription)")
        }
    }
}

#Preview {
    VStack {
        Text("B30")
            .font(DBRFont.B30)
        Text("B16")
            .font(DBRFont.B16)
        Text("B14")
            .font(DBRFont.B14)
        Text("B12")
            .font(DBRFont.B12)

        Divider()

        Text("M20")
            .font(DBRFont.M20)

        Divider()

        Text("R16")
            .font(DBRFont.R16)
        Text("R14")
            .font(DBRFont.R14)
        Text("R12")
            .font(DBRFont.R12)

        Divider()

        Text("I16")
            .font(DBRFont.I16)
        Text("I14")
            .font(DBRFont.I14)
        Text("I12")
            .font(DBRFont.I12)
    }
    .padding()
}
