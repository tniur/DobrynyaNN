import Foundation
import DBRCore

// MARK: - Appointments

extension Resources {
    public struct AppointmentsResource {
        let path: String

        public var get: Request<DataResponse<[AppointmentDTO]>> {
            var query: [(String, String?)] = []
            query.append(("patient_key", Constant.mockPatientKey))

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func appointments() -> AppointmentsResource {
        AppointmentsResource(path: Endpoint.appointments)
    }
}

// MARK: - Cancel Appointment

extension Resources {
    public struct CancelAppointmentResource {
        let path: String
        let id: Int

        public var post: Request<Void> {
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

        public var post: Request<Void> {
            Request(method: .post, path: path, body: body)
        }
    }

    public static func createAppointment(body: NewAppointmentDTO) -> CreateAppointmentResource {
        CreateAppointmentResource(path: Endpoint.createAppointment, body: body)
    }
}
