import Foundation

// MARK: - Appointments

extension DBRResources {
    public struct AppointmentsResource {
        let url: URL
        let path: String
        let key: String

        public var get: DBRRequest<DBRDataResponse<[DBRAppointmentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func appointments(accessTokenKey: String) -> AppointmentsResource {
        AppointmentsResource(url: DBREndpoint.baseURL, path: DBREndpoint.Appointments.all, key: accessTokenKey)
    }
}

// MARK: - Cancel Appointment

extension DBRResources {
    public struct CancelAppointmentResource {
        let url: URL
        let path: String
        let id: Int

        public var post: DBRRequest<DBRDataResponse<DBRCancelAppointmentDTO>> {
            DBRRequest(method: .post, url: url, path: path, body: "\(id)")
        }
    }

    public static func cancelAppointment(id: Int) -> CancelAppointmentResource {
        CancelAppointmentResource(url: DBREndpoint.baseURL, path: DBREndpoint.Appointments.cancel, id: id)
    }
}

// MARK: - Create Appointment

extension DBRResources {
    public struct CreateAppointmentResource {
        let url: URL
        let path: String
        let body: DBRNewAppointmentDTO

        public var post: DBRRequest<DBRDataResponse<DBRCreateAppointmentDTO>> {
            DBRRequest(method: .post, url: url, path: path, body: body)
        }
    }

    public static func createAppointment(body: DBRNewAppointmentDTO) -> CreateAppointmentResource {
        CreateAppointmentResource(url: DBREndpoint.baseURL, path: DBREndpoint.Appointments.create, body: body)
    }
}
