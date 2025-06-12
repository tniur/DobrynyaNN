//
//  DBRBackgroundView.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 12.06.2025.
//

import SwiftUI

public struct DBRBackgroundView<Content: View>: View {
    
    // MARK: - Properties

    let content: () -> Content

    // MARK: - Body
    
    public var body: some View {
        GeometryReader { geometry in
            content()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(DBRColor.base0.swiftUIColor)
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Initializer

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}
