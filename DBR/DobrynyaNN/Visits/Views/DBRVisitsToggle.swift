//
//  DBRVisitsToggle.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 22.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRVisitsToggle: View {
    
    // MARK: - Properties

    @State private var selectedIndex: Int = 0
    
    private let sections: [String]
    
    private var indicatorWidth: CGFloat {
        (UIScreen.main.bounds.width - 32.0) / CGFloat(sections.count)
    }
    
    private var indicatorOffset: CGFloat {
        let segmentWidth = (UIScreen.main.bounds.width - 32.0) / CGFloat(sections.count)
        return CGFloat(selectedIndex) * segmentWidth
    }
    
    // MARK: - Body

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<sections.count, id: \.self) { index in
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedIndex = index
                    }
                }) {
                    Text(sections[index])
                        .font(DBRFont.R14)
                        .foregroundStyle(
                            selectedIndex == index ? DBRColor.base0.swiftUIColor : DBRColor.base5.swiftUIColor
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12.0)
                }
            }
        }
        .background(
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(DBRColor.base2.swiftUIColor)
                Capsule()
                    .fill(DBRColor.blue6.swiftUIColor)
                    .frame(width: indicatorWidth)
                    .offset(x: indicatorOffset)
            }
        )
        .frame(height: 42.0)
        .padding(.horizontal)
    }
    
    init(selectedIndex: Int = 0, sections: [String]) {
        self.selectedIndex = selectedIndex
        self.sections = sections
    }
}
