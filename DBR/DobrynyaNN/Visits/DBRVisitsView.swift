//
//  DBRVisitsView.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 22.05.2025.
//

import SwiftUI
import DBRUIComponents

struct DBRVisitsView: View {
    
    @StateObject private var viewModel: DBRVisitsViewModel
    
    var body: some View {
        VStack {
            DBRVisitsToggle(sections: ["Будущие", "Прошедшие"])
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.visits) { visit in
                        DBRAnalisysView(
                            title: visit.serviceTitle,
                            adress: visit.clinicAddress,
                            doctorName: visit.doctorName,
                            createdDate: visit.createdDate
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.top, 32.0)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    init(viewModel: DBRVisitsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}
