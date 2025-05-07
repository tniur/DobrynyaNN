import Foundation

public struct CancelAppointmentResult: Sendable {
    public let cancelledAppointmentId: Int
    public let status: AppointmentStatus

    public init(cancelledAppointmentId: Int, status: AppointmentStatus) {
        self.cancelledAppointmentId = cancelledAppointmentId
        self.status = status
    }
}
