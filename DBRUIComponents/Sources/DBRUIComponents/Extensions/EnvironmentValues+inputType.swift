//
//  EnvironmentValues+inputType.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

private struct DBRInputTypeKey: EnvironmentKey {
    static let defaultValue: DBRInputType = .other
}

public extension EnvironmentValues {

    var inputType: DBRInputType {
        get { self[DBRInputTypeKey.self] }
        set { self[DBRInputTypeKey.self] = newValue }
    }
}
