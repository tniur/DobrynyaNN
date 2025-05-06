import Foundation
import DBRNetworking
import DBRCore

extension NetworkService: ClinicService {
    public func fetchClinics() async throws -> [Clinic] {
        let data = try await client.send(Resources.clinics().get).data
        return data.map { ClinicMapper.map($0) }
    }

    public func fetchProfessions() async throws -> [Profession] {
        let data = try await client.send(Resources.professions().get).data
        return data.map { ProfessionMapper.map($0) }
    }

    public func fetchServiceCategories() async throws -> [ServiceCategory] {
        let data = try await client.send(Resources.serviceCategories().get).data
        return data.map { ServiceCategoryMapper.map($0) }
    }

    public func fetchServices(serviceIds: [Int]?, professionId: Int?, categoryIds: [Int]?) async throws -> [Service] {
        let data = try await client.send(
            Resources.services(
                serviceIds: serviceIds,
                professionId: professionId,
                categoryIds: categoryIds
            ).get
        ).data
        return data.map { ServiceMapper.map($0) }
    }

    public func fetchServices(categoryId: Int) async throws -> [Service] {
        let data = try await client.send(Resources.services(categoryIds: [categoryId]).get).data
        return data.map { ServiceMapper.map($0) }
    }
}
