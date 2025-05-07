import Foundation
import DBRNetworking
import DBRCore

extension NetworkService: AppointmentsService {
    public func fetchAppointments() async throws -> [Appointment] {
        let data = try await client.send(Resources.appointments(accessTokenKey: accessTokenKey).get).data
        return data.map { AppointmentMapper.map($0) }
    }

    public func cancelAppointment(with id: Int) async throws -> CancelAppointmentResult {
        let data = try await client.send(Resources.cancelAppointment(id: id).post).data
        return CancelAppointmentMapper.map(data)
    }

    public func createAppointment(_ newAppointment: NewAppointment) async throws -> CreateAppointmentResult {
        let newAppointmentBody = NewAppointmentMapper.map(newAppointment)
        let data = try await client.send(Resources.createAppointment(body: newAppointmentBody).post).data
        return CreateAppointmentMapper.map(data)
    }
}
