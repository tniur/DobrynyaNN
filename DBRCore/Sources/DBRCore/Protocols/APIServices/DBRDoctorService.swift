import Foundation

public protocol DBRDoctorService {
    func fetchDoctors(
        professionId: Int?,
        clinicId: Int?,
        userIds: [Int]?,
        serviceIds: [Int]?
    ) async throws -> [DBRDoctor]
    func fetchDoctors(clinicId: Int, serviceId: Int) async throws -> [DBRDoctor]
    func fetchDoctorSchedule(doctorId: Int, clinicId: Int) async throws -> DBRSchedule
}
