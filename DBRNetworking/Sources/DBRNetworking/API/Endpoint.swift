import Foundation

enum Endpoint {}

// MARK: - Auth

extension Endpoint {
    static let authConfirmCode = "auth/confirmCode"
    static let authRequestCode = "auth/requestCode"
}

// MARK: - Profile

extension Endpoint {
    static let patientInfo = "getPatientInfo"
    static let labResults = "getPatientLabResults"
    static let labResultDetails = "getPatientLabResultDetails"
    static let documents = "getPatientDocuments"
    static let documentDetails = "getPatientDocumentDetails"
    static let consultations = "getPatientConsultations"
    static let consultationDetails = "getPatientConsultationDetails"
    static let uploadPatientAvatar = "uploadPatientAvatar"
}

// MARK: - Clinic Info

extension Endpoint {
    static let clinics = "getClinics"
    static let professions = "getProfessions"
    static let serviceCategories = "getServiceCategories"
    static let services = "getServices"
}

// MARK: - Doctor Info

extension Endpoint {
    static let users = "getUsers"
    static let schedule = "getSchedule"
}

// MARK: - Appointments

extension Endpoint {
    static let appointments = "getPatientAppointments"
    static let cancelAppointment = "cancelAppointment"
    static let createAppointment = "createAppointment"
}
