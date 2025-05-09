import Foundation
import DBRNetworking
import DBRCore

public struct CreateAppointmentMapper {
    static func map(_ dto: CreateAppointmentDTO) -> CreateAppointmentResult {
        CreateAppointmentResult(newAppointmentId: dto.appointmentId)
    }
}
