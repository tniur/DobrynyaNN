import Foundation
import DBRNetworking
import DBRCore

public struct DBRCreateAppointmentMapper {
    static func map(_ dto: DBRCreateAppointmentDTO) -> DBRCreateAppointmentResult {
        DBRCreateAppointmentResult(newAppointmentId: dto.appointmentId)
    }
}
