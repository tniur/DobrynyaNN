import Foundation

// MARK: - Appointments

extension Resources {
    public struct AppointmentsResource {
        let url: URL
        let path: String
        let key: String

        public var get: Request<DataResponse<[AppointmentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func appointments(accessTokenKey: String) -> AppointmentsResource {
        AppointmentsResource(url: Endpoint.baseURL, path: Endpoint.Appointments.all, key: accessTokenKey)
    }
}

// MARK: - Cancel Appointment

extension Resources {
    public struct CancelAppointmentResource {
        let url: URL
        let path: String
        let id: Int

        public var post: Request<DataResponse<CancelAppointmentDTO>> {
            Request(method: .post, url: url, path: path, body: "\(id)")
        }
    }

    public static func cancelAppointment(id: Int) -> CancelAppointmentResource {
        CancelAppointmentResource(url: Endpoint.baseURL, path: Endpoint.Appointments.cancel, id: id)
    }
}

// MARK: - Create Appointment

extension Resources {
    public struct CreateAppointmentResource {
        let url: URL
        let path: String
        let body: NewAppointmentDTO

        public var post: Request<DataResponse<CreateAppointmentDTO>> {
            Request(method: .post, url: url, path: path, body: body)
        }
    }

    public static func createAppointment(body: NewAppointmentDTO) -> CreateAppointmentResource {
        CreateAppointmentResource(url: Endpoint.baseURL, path: Endpoint.Appointments.create, body: body)
    }
}
