import Foundation

public protocol AppointmentsService {
    func fetchAppointments() async throws -> [Appointment]
    func cancelAppointment(with id: Int) async throws -> CancelAppointmentResult
    func createAppointment(_ newAppointment: NewAppointment) async throws -> CreateAppointmentResult
}
