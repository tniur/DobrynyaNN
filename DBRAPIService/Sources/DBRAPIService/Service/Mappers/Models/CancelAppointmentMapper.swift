import Foundation
import DBRNetworking
import DBRCore

public struct CancelAppointmentMapper {
    static func map(_ dto: CancelAppointmentDTO) -> CancelAppointmentResult {
        let status = AppointmentStatus(fromRawValue: dto.status)
        return CancelAppointmentResult(cancelledAppointmentId: dto.appointmentId, status: status)
    }
}
