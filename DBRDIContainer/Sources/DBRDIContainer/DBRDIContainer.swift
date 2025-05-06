import Factory
import DBRCore
import DBRNetworking

public extension Container {
    var profileService: Factory<ProfileService> {
        Factory(self) { NetworkService(client: NetworkClient(baseURL: Constant.baseURL), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var clinicService: Factory<ClinicService> {
        Factory(self) { NetworkService(client: NetworkClient(baseURL: Constant.baseURL), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var doctorService: Factory<DoctorService> {
        Factory(self) { NetworkService(client: NetworkClient(baseURL: Constant.baseURL), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var appointmentsService: Factory<AppointmentsService> {
        Factory(self) { NetworkService(client: NetworkClient(baseURL: Constant.baseURL), accessTokenKey: Constant.mockPatientKey) }
    }
}

public extension Container {
    var pdfManager: Factory<PDFManager> {
        Factory(self) { DocumentManager() }
    }
}
