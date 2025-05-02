import Foundation

public protocol DoctorService {
    func fetchDoctors(professionId: Int?, clinicId: Int?, userIds: [Int]?, serviceIds: [Int]?) async throws -> [Doctor]
    func fetchDoctors(clinicId: Int, serviceId: Int) async throws -> [Doctor]
    func fetchDoctorSchedules(doctorId: Int, clinicId: Int) async throws -> [DoctorSchedule]
}
