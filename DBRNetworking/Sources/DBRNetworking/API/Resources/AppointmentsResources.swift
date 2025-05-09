import Foundation

// MARK: - Appointments

extension Resources {
    public struct AppointmentsResource {
        let path: String
        let key: String

        public var get: Request<DataResponse<[AppointmentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", key))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func appointments(accessTokenKey: String) -> AppointmentsResource {
        AppointmentsResource(path: Endpoint.appointments, key: accessTokenKey)
    }
}

// MARK: - Cancel Appointment

extension Resources {
    public struct CancelAppointmentResource {
        let path: String
        let id: Int

        public var post: Request<DataResponse<CancelAppointmentDTO>> {
            Request(method: .post, path: path, body: "\(id)")
        }
    }

    public static func cancelAppointment(id: Int) -> CancelAppointmentResource {
        CancelAppointmentResource(path: Endpoint.cancelAppointment, id: id)
    }
}

// MARK: - Create Appointment

extension Resources {
    public struct CreateAppointmentResource {
        let path: String
        let body: NewAppointmentDTO

        public var post: Request<DataResponse<CreateAppointmentDTO>> {
            Request(method: .post, path: path, body: body)
        }
    }

    public static func createAppointment(body: NewAppointmentDTO) -> CreateAppointmentResource {
        CreateAppointmentResource(path: Endpoint.createAppointment, body: body)
    }
}
