import Foundation
import DBRCore

extension NetworkAPI: DoctorService {
    public func fetchDoctors(professionId: Int?, clinicId: Int?, userIds: [Int]?, serviceIds: [Int]?) async throws -> [Doctor] {
        let data = try await client.send(Resources.doctors(professionId: professionId, clinicId: clinicId, userIds: userIds, serviceIds: serviceIds).get).data
        return data.map { $0.toDomain() }
    }
    
    public func fetchDoctors(clinicId: Int, serviceId: Int) async throws -> [Doctor] {
        let data = try await client.send(Resources.doctors(professionId: nil, clinicId: clinicId, userIds: nil, serviceIds: [serviceId]).get).data
        return data.map { $0.toDomain() }
    }

    public func fetchDoctorSchedule(doctorId: Int, clinicId: Int) async throws -> Schedule {
        let data = try await client.send(Resources.schedule(doctorId: doctorId, clinicId: clinicId).get).data
        let scheduleSlot: [ScheduleSlot] = try data.map { try $0.toDomain() }
        return Schedule(slots: scheduleSlot)
    }
}
