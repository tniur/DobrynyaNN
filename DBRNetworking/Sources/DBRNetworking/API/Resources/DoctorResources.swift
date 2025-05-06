import Foundation

// MARK: - Doctors

extension Resources {
    public struct DoctorsResource {
        let path: String
        let professionId: Int?
        let clinicId: Int?
        let userIds: [Int]?
        let serviceIds: [Int]?

        public var get: Request<DataResponse<[DoctorDTO]>> {
            var query: [(String, String?)] = []

            if let clinicId {
                query.append(("clinic_id", String(clinicId)))
            }

            if let professionId {
                query.append(("profession_id", String(professionId)))
            }

            if let serviceIds, !serviceIds.isEmpty {
                let value = serviceIds.map(String.init).joined(separator: ",")
                query.append(("service_id", value))
            }

            if let userIds, !userIds.isEmpty {
                let value = userIds.map(String.init).joined(separator: ",")
                query.append(("user_id", value))
            }

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func doctors(
        professionId: Int?,
        clinicId: Int?,
        userIds: [Int]?,
        serviceIds: [Int]?
    ) -> DoctorsResource {
        DoctorsResource(
            path: Endpoint.users,
            professionId: professionId,
            clinicId: clinicId,
            userIds: userIds,
            serviceIds: serviceIds
        )
    }
}

// MARK: - Doctor Schedule

extension Resources {
    public struct DoctorScheduleResource {
        let path: String
        let doctorId: Int
        let clinicId: Int?

        public var get: Request<DataResponse<[ScheduleSlotDTO]>> {
            var query: [(String, String?)] = []

            query.append(("user_id", String(doctorId)))

            if let clinicId {
                query.append(("clinic_id", String(clinicId)))
            }

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func schedule(doctorId: Int, clinicId: Int?) -> DoctorScheduleResource {
        DoctorScheduleResource(path: Endpoint.schedule, doctorId: doctorId, clinicId: clinicId)
    }
}
