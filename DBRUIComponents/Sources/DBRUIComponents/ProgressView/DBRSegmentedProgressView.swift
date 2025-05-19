//
//  DBRSegmentedProgressView.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 08.05.2025.
//

import SwiftUI

public struct DBRSegmentedProgressView: View {
    
    // MARK: - Constants

    private enum Constant {
        static let spacing: CGFloat = 4.0
        static let height: CGFloat = 4.0
    }
    
    // MARK: - Propeties
    
    private let progress: Int
    private let totalSegments: Int

    // MARK: - Body

    public var body: some View {
        HStack(spacing: Constant.spacing) {
            ForEach(0..<totalSegments, id: \.self) { index in
                Capsule()
                    .fill(index < progress
                          ? DBRColor.blue6.swiftUIColor
                          : DBRColor.base3.swiftUIColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: Constant.height)
            }
        }
    }
    
    // MARK: - Initializer

    public init(progress: Int, totalSegments: Int) {
        self.progress = progress
        self.totalSegments = totalSegments
    }
}
