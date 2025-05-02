import Foundation
import DBRCore

extension NetworkAPI: ClinicService {
    public func fetchClinics() async throws -> [Clinic] {
        let data = try await client.send(Resources.clinics().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchProfessions() async throws -> [Profession] {
        let data = try await client.send(Resources.professions().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchServiceCategories() async throws -> [ServiceCategory] {
        let data = try await client.send(Resources.serviceCategories().get).data
        return data.map { $0.toDomain() }
    }

    public func fetchServices(serviceId: [Int]?, professionId: Int?, categoryId: [Int]?) async throws -> [Service] {
        let data = try await client.send(Resources.services(serviceId: serviceId, professionId: professionId, categoryId: categoryId).get).data
        return data.map { $0.toDomain() }
    }

    public func fetchServices(categoryId: Int) async throws -> [Service] {
        let data = try await client.send(Resources.services(categoryId: [categoryId]).get).data
        return data.map { $0.toDomain() }
    }
}
