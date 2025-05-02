import Foundation

public protocol ClinicService {
    func fetchClinics() async throws -> [Clinic]
    func fetchProfessions() async throws -> [Profession]
    func fetchServiceCategories() async throws -> [ServiceCategory]
    func fetchServices(serviceId: [Int]?, professionId: Int?, categoryId: [Int]?) async throws -> [Service]
    func fetchServices(categoryId: Int) async throws -> [Service]
}
