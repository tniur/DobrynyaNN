import Factory
import DBRCore
import DBRAPIService
import DBRNetworking

// MARK: - Token Provider

public extension Container {
    var tokenProvider: Factory<DBRTokenProvider> {
        Factory(self) { DBRAccessTokenProvider() }
    }
}

// MARK: - PDF Manager

public extension Container {
    var pdfManager: Factory<DBRPDFManager> {
        Factory(self) { DBRDocumentManager() }
    }
}

// MARK: - Services

public extension Container {
    var profileService: Factory<DBRProfileService> {
        return Factory(self) { DBRAPIService(client: DBRNetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var clinicService: Factory<DBRClinicService> {
        Factory(self) { DBRAPIService(client: DBRNetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var doctorService: Factory<DBRDoctorService> {
        Factory(self) { DBRAPIService(client: DBRNetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var appointmentsService: Factory<DBRAppointmentsService> {
        Factory(self) { DBRAPIService(client: DBRNetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var authService: Factory<DBRAuthService> {
        Factory(self) { DBRAPIService(client: DBRNetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var registerService: Factory<DBRRegisterService> {
        Factory(self) { DBRAPIService(client: DBRNetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var recoverService: Factory<DBRRecoverService> {
        Factory(self) { DBRAPIService(client: DBRNetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}
