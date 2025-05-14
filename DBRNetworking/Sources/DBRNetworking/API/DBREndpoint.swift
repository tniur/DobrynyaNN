import Foundation

public enum DBREndpoint {
    public static let baseURL = URL(string: "http://45.144.65.153:8000")!

    enum Auth {
        static let confirmCode = "auth/confirmCode"
        static let requestCode = "auth/requestCode"
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
