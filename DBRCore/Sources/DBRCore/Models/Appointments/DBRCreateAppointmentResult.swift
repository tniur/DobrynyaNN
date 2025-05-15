import Foundation

public struct DBRCreateAppointmentResult: Sendable {
    public let newAppointmentId: Int

    public init(newAppointmentId: Int) {
        self.newAppointmentId = newAppointmentId
    }
}
