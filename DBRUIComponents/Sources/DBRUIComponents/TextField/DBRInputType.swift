//
//  DBRInputType.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

import SwiftUI

public enum DBRInputType: Sendable {
    case phone
    case other

    public var inputPattern: String? {
        switch self {
        case .phone:
            return "+7 (###) ###-##-##"
        case .other:
            return nil
        }
    }
}
