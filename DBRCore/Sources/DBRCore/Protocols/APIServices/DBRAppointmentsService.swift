import Foundation

public protocol DBRAppointmentsService {
    func fetchAppointments() async throws -> [DBRAppointment]
    func fetchAppointment(by id: Int) async throws -> DBRAppointment?
    func cancelAppointment(with id: Int) async throws -> DBRCancelAppointmentResult
    func createAppointment(_ newAppointment: DBRNewAppointment) async throws -> DBRCreateAppointmentResult
}
