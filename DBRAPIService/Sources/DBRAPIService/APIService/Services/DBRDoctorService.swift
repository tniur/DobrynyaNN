import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRDoctorService {
    public func fetchDoctors(
        professionId: Int?,
        clinicId: Int?,
        userIds: [Int]?,
        serviceIds: [Int]?) async throws -> [DBRDoctor] {

        do {
            let data = try await client.send(
                DBRResources.doctors(
                    professionId: professionId,
                    clinicId: clinicId,
                    userIds: userIds,
                    serviceIds: serviceIds
                ).get
            ).data
                return data.map { DBRDoctorMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchDoctors(clinicId: Int, serviceId: Int) async throws -> [DBRDoctor] {
        do {
            let data = try await client.send(
                DBRResources.doctors(
                    professionId: nil,
                    clinicId: clinicId,
                    userIds: nil,
                    serviceIds: [serviceId]
                ).get
            ).data
            return data.map { DBRDoctorMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchDoctorSchedule(doctorId: Int, clinicId: Int) async throws -> DBRSchedule {
        do {
            let data = try await client.send(DBRResources.schedule(doctorId: doctorId, clinicId: clinicId).get).data
            let scheduleSlot: [DBRScheduleSlot] = try data.map { try DBRScheduleSlotMapper.map($0) }
            return DBRSchedule(slots: scheduleSlot)
        } catch {
            throw handle(error)
        }
    }
}
