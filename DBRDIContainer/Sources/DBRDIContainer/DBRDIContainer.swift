import Factory
import DBRCore
import DBRAPIService
import DBRNetworking

public extension Container {
    var profileService: Factory<ProfileService> {
        Factory(self) { APIService(client: NetworkClient(), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var clinicService: Factory<ClinicService> {
        Factory(self) { APIService(client: NetworkClient(), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var doctorService: Factory<DoctorService> {
        Factory(self) { APIService(client: NetworkClient(), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var appointmentsService: Factory<AppointmentsService> {
        Factory(self) { APIService(client: NetworkClient(), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var authService: Factory<AuthService> {
        Factory(self) { APIService(client: NetworkClient(), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var pdfManager: Factory<PDFManager> {
        Factory(self) { DocumentManager() }
    }
}
