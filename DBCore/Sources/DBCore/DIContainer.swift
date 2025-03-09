import Factory
import DBNetworking

extension Container {
    public var networkingService: Factory<NetworkingService> {
        self { NetworkingServiceImpl() }.singleton
    }
}
