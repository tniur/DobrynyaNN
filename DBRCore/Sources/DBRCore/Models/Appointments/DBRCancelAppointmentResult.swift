import Foundation

public struct DBRCancelAppointmentResult: Sendable {
    public let cancelledAppointmentId: Int
    public let status: DBRAppointmentStatus

    public init(cancelledAppointmentId: Int, status: DBRAppointmentStatus) {
        self.cancelledAppointmentId = cancelledAppointmentId
        self.status = status
    }
}
