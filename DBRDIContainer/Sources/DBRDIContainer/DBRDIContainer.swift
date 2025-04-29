import Factory
import DBRCore
import DBRNetworking

public extension Container {
    var profileService: Factory<ProfileService> {
        Factory(self) { NetworkAPI(client: NetworkClient(baseURL: Constant.baseURL)) }
    }
}

public extension Container {
    var pdfManager: Factory<PDFManager> {
        Factory(self) { DocumentManager() }
    }
}
