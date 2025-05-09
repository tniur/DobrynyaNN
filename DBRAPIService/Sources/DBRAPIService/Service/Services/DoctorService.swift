import Foundation
import DBRNetworking
import DBRCore

extension NetworkService: DoctorService {
    public func fetchDoctors(
        professionId: Int?,
        clinicId: Int?,
        userIds: [Int]?,
        serviceIds: [Int]?) async throws -> [Doctor] {

        do {
            let data = try await client.send(
                Resources.doctors(
                    professionId: professionId,
                    clinicId: clinicId,
                    userIds: userIds,
                    serviceIds: serviceIds
                ).get
            ).data
                return data.map { DoctorMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchDoctors(clinicId: Int, serviceId: Int) async throws -> [Doctor] {
        do {
            let data = try await client.send(
                Resources.doctors(
                    professionId: nil,
                    clinicId: clinicId,
                    userIds: nil,
                    serviceIds: [serviceId]
                ).get
            ).data
            return data.map { DoctorMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchDoctorSchedule(doctorId: Int, clinicId: Int) async throws -> Schedule {
        do {
            let data = try await client.send(Resources.schedule(doctorId: doctorId, clinicId: clinicId).get).data
            let scheduleSlot: [ScheduleSlot] = try data.map { try ScheduleSlotMapper.map($0) }
            return Schedule(slots: scheduleSlot)
        } catch {
            throw handle(error)
        }
    }
}
