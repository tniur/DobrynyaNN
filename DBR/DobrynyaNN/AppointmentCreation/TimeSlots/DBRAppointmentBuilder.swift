//
//  DBRAppointmentBuilder.swift
//  DobrynyaNN
//
//  Created by Анастасия Журавлева on 06.05.2025.
//

import DBRCore

public protocol AppointmentBuilder {
    func build() -> DBRNewAppointment?
    func setDoctor(id: Int)
    func setClinic(id: Int)
    func setCategory(id: Int)
    func setService(id: Int)
    func setDateInterval(interval: DBRSlotDateInterval)
    func getDoctorId() -> Int?
    func getClinicId() -> Int?
    func getCategoryId() -> Int?
    func getServiceId() -> Int?
    func getDateInterval() -> DBRSlotDateInterval?
}

final class DBRAppointmentBuilder: AppointmentBuilder {
    
    // MARK: - Properties

    var isReadyForSubmission: Bool {
        doctorId != nil &&
        clinicId != nil &&
        serviceId != nil &&
        dateInterval != nil
    }

    private var doctorId: Int?
    private var clinicId: Int?
    private var categoryId: Int?
    private var serviceId: Int?
    private var dateInterval: DBRSlotDateInterval?

    // MARK: - Methods
    
    func build() -> DBRNewAppointment? {
        guard let doctorId = doctorId,
              let clinicId = clinicId,
              let serviceId = serviceId,
              let dateInterval = dateInterval else {
            return nil
        }

        return DBRNewAppointment(
            doctorId: doctorId,
            clinicId: clinicId,
            serviceId: serviceId,
            timeStart: dateInterval.start,
            timeEnd: dateInterval.end
        )
    }

    func setDoctor(id: Int) {
        self.doctorId = id
    }

    func setClinic(id: Int) {
        self.clinicId = id
    }

    func setCategory(id: Int) {
        self.categoryId = id
    }

    func setService(id: Int) {
        self.serviceId = id
    }

    func setDateInterval(interval: DBRSlotDateInterval) {
        self.dateInterval = interval
    }

    func getDoctorId() -> Int? {
        doctorId
    }
    
    func getClinicId() -> Int? {
        clinicId
    }
    
    func getCategoryId() -> Int? {
        categoryId
    }
    
    func getServiceId() -> Int? {
        serviceId
    }
    
    func getDateInterval() -> DBRSlotDateInterval? {
        dateInterval
    }
}
