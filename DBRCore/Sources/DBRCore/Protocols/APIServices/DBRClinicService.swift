import Foundation

public protocol DBRClinicService {
    func fetchClinics() async throws -> [DBRClinic]
    func fetchProfessions() async throws -> [DBRProfession]
    func fetchServiceCategories() async throws -> [DBRServiceCategory]
    func fetchServices(serviceIds: [Int]?, professionId: Int?, categoryIds: [Int]?) async throws -> [DBRService]
    func fetchServices(categoryId: Int) async throws -> [DBRService]
}
