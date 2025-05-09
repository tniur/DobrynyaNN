//
//  DBRTimeSlotsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 06.05.2025.
//

import Foundation
import DBRCore
import Nivelir

final class DBRTimeSlotsViewModel: ObservableObject {
    
    // MARK: - Properties

//    let appoinmentBuilder: DBRAppointmentBuilder
    let doctorService = DoctorService()
    
    @Published var schedule: Schedule?
    @Published var selectedDate = Date()
    @Published var selectedSlot = SlotDateInterval(start: "", end: "")
    
    private var screenNavigator: ScreenNavigator
    private let screens: DBRTimeSlotsScreens
    
    // MARK: - Initializer

    init(screenNavigator: ScreenNavigator, screens: DBRTimeSlotsScreens) {
        self.screenNavigator = screenNavigator
        self.screens = screens
    }
    
    // MARK: - Methods

    func loadData() {
        schedule = doctorService.fetchSchedule()
    }
    
    func setAppoinmentTime(slotDateInterval: SlotDateInterval) {
        print("Appoinment Builder set: ", slotDateInterval)
        selectedSlot = slotDateInterval
//        appoinmentBuilder.setDateInterval(interval: slotDateInterval)
    }

    func slots(for date: Date) -> [ScheduleSlot] {
        schedule?.slots(for: date) ?? []
    }
    
    @MainActor
    func showSuccessfulRecord() {
        screenNavigator.navigate(to: screens.showSuccessfulRecordRoute())
    }
}

class DoctorService {
    func fetchSchedule() -> Schedule {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let slots: [ScheduleSlot] = [
            ScheduleSlot(
                date: formatter.date(from: "2025-05-05")!,
                timeStart: "09:00",
                timeEnd: "09:30",
                slotDateInterval: SlotDateInterval(start: "2025-05-05 09:00", end: "2025-05-05 09:30")
            ),
            ScheduleSlot(
                date: formatter.date(from: "2025-05-05")!,
                timeStart: "10:00",
                timeEnd: "10:30",
                slotDateInterval: SlotDateInterval(start: "2025-05-05 10:00", end: "2025-05-05 10:30")
            ),
            ScheduleSlot(
                date: formatter.date(from: "2025-05-05")!,
                timeStart: "11:00",
                timeEnd: "11:30",
                slotDateInterval: SlotDateInterval(start: "2025-05-05 11:00", end: "2025-05-05 11:30")
            ),
            ScheduleSlot(
                date: formatter.date(from: "2025-05-06")!,
                timeStart: "09:00",
                timeEnd: "09:30",
                slotDateInterval: SlotDateInterval(start: "2025-05-06 09:00", end: "2025-05-06 09:30")
            ),
            ScheduleSlot(
                date: formatter.date(from: "2025-05-06")!,
                timeStart: "10:00",
                timeEnd: "10:30",
                slotDateInterval: SlotDateInterval(start: "2025-05-06 10:00", end: "2025-05-06 10:30")
            ),
        ]
        
        return Schedule(slots: slots)
    }
}
