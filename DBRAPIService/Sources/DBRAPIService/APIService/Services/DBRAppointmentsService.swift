import Foundation
import DBRNetworking
import DBRCore

extension DBRAPIService: DBRAppointmentsService {
    public func fetchAppointments() async throws -> [DBRAppointment] {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(DBRResources.appointments(accessTokenKey: key).get).data
            return data.map { DBRAppointmentMapper.map($0) }
        } catch {
            throw handle(error)
        }
    }

    public func fetchAppointment(by id: Int) async throws -> DBRAppointment? {
        do {
            let key = try tokenProvider.getToken()
            let data = try await client.send(DBRResources.appointments(accessTokenKey: key).get).data
            let appointments = data.map { DBRAppointmentMapper.map($0) }
            return appointments.first
        } catch {
            throw handle(error)
        }
    }

    public func cancelAppointment(with id: Int) async throws -> DBRCancelAppointmentResult {
        do {
            let data = try await client.sendValidated(DBRResources.cancelAppointment(id: id).post).data
            return DBRCancelAppointmentMapper.map(data)
        } catch {
            throw handle(error)
        }
    }

    public func createAppointment(_ newAppointment: DBRNewAppointment) async throws -> DBRCreateAppointmentResult {
        do {
            let key = try tokenProvider.getToken()
            let newAppointmentBody = DBRNewAppointmentMapper.map(newAppointment, patientKey: key)
            let data = try await client.sendValidated(
                DBRResources.createAppointment(body: newAppointmentBody).post
            ).data
            return DBRCreateAppointmentMapper.map(data)
        } catch {
            throw handle(error)
        }
    }
}
