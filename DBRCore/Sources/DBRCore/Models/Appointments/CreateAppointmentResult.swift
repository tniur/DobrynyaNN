import Foundation

public struct CreateAppointmentResult: Sendable {
    public let newAppointmentId: Int

    public init(newAppointmentId: Int) {
        self.newAppointmentId = newAppointmentId
    }
}
