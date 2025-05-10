import Factory
import DBRCore
import DBRAPIService
import DBRNetworking

// MARK: - Token Provider

public extension Container {
    var tokenProvider: Factory<TokenProvider> {
        Factory(self) { AccessTokenProvider() }
    }
}

// MARK: - PDF Manager

public extension Container {
    var pdfManager: Factory<PDFManager> {
        Factory(self) { DocumentManager() }
    }
}

// MARK: - Services

public extension Container {
    var profileService: Factory<ProfileService> {
        return Factory(self) { APIService(client: NetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var clinicService: Factory<ClinicService> {
        Factory(self) { APIService(client: NetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var doctorService: Factory<DoctorService> {
        Factory(self) { APIService(client: NetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var appointmentsService: Factory<AppointmentsService> {
        Factory(self) { APIService(client: NetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}

public extension Container {
    var authService: Factory<AuthService> {
        Factory(self) { APIService(client: NetworkClient(), tokenProvider: Container.shared.tokenProvider()) }
    }
}
