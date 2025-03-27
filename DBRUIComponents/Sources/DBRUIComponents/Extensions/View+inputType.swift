//
//  View+inputType.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 27.03.2025.
//

import SwiftUI

public extension View {

    @inlinable nonisolated
    func inputType(_ type: DBRInputType) -> some View {
        environment(\.inputType, type)
    }
}
