import Foundation
import DBRCore

extension NetworkAPI: AppointmentsService {
    public func fetchAppointments() async throws -> [Appointment] {
        let data = try await client.send(Resources.appointments().get).data
        return data.map { AppointmentMapper.map($0) }
    }

    public func cancelAppointment(with id: Int) async throws {
        try await client.send(Resources.cancelAppointment(id: id).post)
    }

    public func createAppointment(_ newAppointment: NewAppointment) async throws {
        let newAppointmentBody = NewAppointmentMapper.map(newAppointment)
        try await client.send(Resources.createAppointment(body: newAppointmentBody).post)
    }
}
