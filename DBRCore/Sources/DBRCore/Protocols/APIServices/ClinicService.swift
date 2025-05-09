import Foundation

public protocol ClinicService {
    func fetchClinics() async throws -> [Clinic]
    func fetchProfessions() async throws -> [Profession]
    func fetchServiceCategories() async throws -> [ServiceCategory]
    func fetchServices(serviceIds: [Int]?, professionId: Int?, categoryIds: [Int]?) async throws -> [Service]
    func fetchServices(categoryId: Int) async throws -> [Service]
}
