import Foundation
import DBRNetworking
import DBRCore

extension NetworkService: AppointmentsService {
    public func fetchAppointments() async throws -> [Appointment] {
        do {
            let data = try await client.send(Resources.appointments(accessTokenKey: accessTokenKey).get).data
            return data.map { AppointmentMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func cancelAppointment(with id: Int) async throws -> CancelAppointmentResult {
        do {
            let data = try await client.sendValidated(Resources.cancelAppointment(id: id).post).data
            return CancelAppointmentMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func createAppointment(_ newAppointment: NewAppointment) async throws -> CreateAppointmentResult {
        do {
            let newAppointmentBody = NewAppointmentMapper.map(newAppointment)
            let data = try await client.sendValidated(Resources.createAppointment(body: newAppointmentBody).post).data
            return CreateAppointmentMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
