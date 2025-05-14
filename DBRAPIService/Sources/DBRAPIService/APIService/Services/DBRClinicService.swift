import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRClinicService {
    public func fetchClinics() async throws -> [DBRClinic] {
        do {
            let data = try await client.send(DBRResources.clinics().get).data
            return data.map { DBRClinicMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchProfessions() async throws -> [DBRProfession] {
        do {
            let data = try await client.send(DBRResources.professions().get).data
            return data.map { DBRProfessionMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchServiceCategories() async throws -> [DBRServiceCategory] {
        do {
            let data = try await client.send(DBRResources.serviceCategories().get).data
            return data.map { DBRServiceCategoryMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchServices(
        serviceIds: [Int]?,
        professionId: Int?,
        categoryIds: [Int]?
    ) async throws -> [DBRService] {
        do {
            let data = try await client.send(
                DBRResources.services(
                    serviceIds: serviceIds,
                    professionId: professionId,
                    categoryIds: categoryIds
                ).get
            ).data
            return data.map { DBRServiceMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchServices(categoryId: Int) async throws -> [DBRService] {
        do {
            let data = try await client.send(DBRResources.services(categoryIds: [categoryId]).get).data
            return data.map { DBRServiceMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }
}
