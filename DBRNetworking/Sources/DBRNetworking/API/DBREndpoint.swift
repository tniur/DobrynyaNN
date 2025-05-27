import Foundation

public enum DBREndpoint {
    public static let baseURL = URL(string: "http://45.144.65.153:8000")!

    enum Auth {
        static let confirmCode = "auth/confirmCode"
        static let requestCode = "auth/requestCode"
    }

    enum Register {
        static let confirmCode = "register/confirmCode"
        static let requestCode = "register/requestCode"
    }

    enum Recover {
        static let confirmCode = "recover/confirmCode"
        static let requestCode = "recover/requestCode"
        static let setPassword = "recover/setPassword"
    }

    enum Profile {
        static let patientInfo = "getPatientInfo"
        static let labResults = "getPatientLabResults"
        static let labResultDetails = "getPatientLabResultDetails"
        static let documents = "getPatientDocuments"
        static let documentDetails = "getPatientDocumentDetails"
        static let consultations = "getPatientConsultations"
        static let consultationDetails = "getPatientConsultationDetails"
        static let uploadPatientAvatar = "uploadPatientAvatar"
        static let updatePatientInfo = "updatePatientInfo"
    }

    enum ClinicInfo {
        static let clinics = "getClinics"
        static let professions = "getProfessions"
        static let serviceCategories = "getServiceCategories"
        static let services = "getServices"
    }

    enum DoctorInfo {
        static let users = "getUsers"
        static let schedule = "getSchedule"
    }

    enum Appointments {
        static let all = "getPatientAppointments"
        static let cancel = "cancelAppointment"
        static let create = "createAppointment"
    }
}
