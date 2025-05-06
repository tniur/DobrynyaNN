import Foundation
import DBRNetworking
import DBRCore

struct AppointmentMapper {
    static func map(_ dto: AppointmentDTO) -> Appointment {
        Appointment(
            id: dto.appointmentId,
            date: dto.date,
            time: dto.time,
            timeStart: dto.timeStart,
            timeEnd: dto.timeEnd,
            clinicId: dto.clinicId,
            doctorId: dto.doctorId,
            createdDate: dto.created,
            status: AppointmentStatus(fromRawValue: dto.status)
        )
    }
}
