import Foundation
import DBRNetworking
import DBRCore

extension APIService: AppointmentsService {
    public func fetchAppointments() async throws -> [Appointment] {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(Resources.appointments(accessTokenKey: key).get).data
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
            let key = try tokenProvider.getToken()
            let newAppointmentBody = NewAppointmentMapper.map(newAppointment, patientKey: key)
            let data = try await client.sendValidated(Resources.createAppointment(body: newAppointmentBody).post).data
            return CreateAppointmentMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
