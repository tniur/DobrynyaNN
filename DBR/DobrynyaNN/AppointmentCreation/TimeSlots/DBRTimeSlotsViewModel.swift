//
//  DBRTimeSlotsViewModel.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 06.05.2025.
//

import Foundation
import DBRCore
import Nivelir
import Factory
import DBRCore

final class DBRTimeSlotsViewModel: ObservableObject {
    
    // MARK: - Properties

    @Injected(\.doctorService) private var doctorService: DBRDoctorService
    @Injected(\.appointmentsService) private var appointmentsService: DBRAppointmentsService

    @Published var isLoading = false
    @Published var schedule: DBRSchedule?
    @Published var selectedDate = Date()
    @Published var selectedSlot: DBRSlotDateInterval?
    
    var today: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    private var createAppointmentResult: DBRCreateAppointmentResult?
    private let appointmentBuilder: AppointmentBuilder

    private var screenNavigator: ScreenNavigator
    private let screens: DBRTimeSlotsScreens
    
    // MARK: - Initializer

    init(
        screenNavigator: ScreenNavigator,
        screens: DBRTimeSlotsScreens,
        appointmentBuilder: AppointmentBuilder
    ) {
        self.screenNavigator = screenNavigator
        self.screens = screens
        self.appointmentBuilder = appointmentBuilder
    }
    
    // MARK: - Methods

    @MainActor
    func fetchData() {
        isLoading = true
        
        Task {
            guard
                let clinicId = appointmentBuilder.getClinicId(),
                let doctorId = appointmentBuilder.getDoctorId()
            else { return }
            do {
                schedule = try await doctorService.fetchDoctorSchedule(
                    doctorId: doctorId,
                    clinicId: clinicId
                )
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    print(error.localizedDescription)
                    // навигация до экранок авторизации
                default:
                    // потеря сети, выключенная связь и другие DomainError
                    print(error.localizedDescription)
                }
            } catch {
                // необрабатываемые ошибки
                print(error.localizedDescription)
            }
            isLoading = false
        }
    }
    
    @MainActor
    func createAppointment() {
        isLoading = true
        Task {
            guard
                let appointment = appointmentBuilder.build()
            else { return }
            do {
                createAppointmentResult = try await appointmentsService.createAppointment(appointment)
                showSuccessfulRecord(with: createAppointmentResult?.newAppointmentId ?? 0)
            } catch let error as DBRError {
                switch error {
                case .unauthorized:
                    print(error.localizedDescription)
                    // навигация до экранок авторизации
                default:
                    // потеря сети, выключенная связь и другие DomainError
                    print(error.localizedDescription)
                }
            } catch {
                // необрабатываемые ошибки
                print(error.localizedDescription)
            }
            isLoading = false
        }
    }
    
    @MainActor
    func appoinmentTimeDidSelected(slotDateInterval: DBRSlotDateInterval) {
        selectedSlot = slotDateInterval
        appointmentBuilder.setDateInterval(interval: slotDateInterval)
    }

    @MainActor
    func slots(for date: Date) -> [DBRScheduleSlot] {
        schedule?.slots(for: date) ?? []
    }
    
    @MainActor
    private func showSuccessfulRecord(with newAppointmentId: Int) {
        screenNavigator.navigate(to: screens.showSuccessfulRecordRoute(newAppointmentId: newAppointmentId))
    }
}
