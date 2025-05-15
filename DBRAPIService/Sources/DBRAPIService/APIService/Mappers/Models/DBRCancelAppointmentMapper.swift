import Foundation
import DBRNetworking
import DBRCore

public struct DBRCancelAppointmentMapper {
    static func map(_ dto: DBRCancelAppointmentDTO) -> DBRCancelAppointmentResult {
        let status = DBRAppointmentStatus(fromRawValue: dto.status)
        return DBRCancelAppointmentResult(cancelledAppointmentId: dto.appointmentId, status: status)
    }
}
