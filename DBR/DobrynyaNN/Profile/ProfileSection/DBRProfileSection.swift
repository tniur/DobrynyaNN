//
//  DBRProfileSection.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 01.06.2025.
//

import SwiftUICore

struct DBRProfileSection: Identifiable {
    let id = UUID()
    let name: String
    let icon: Image
    let type: DBRProfileSectionType
}
