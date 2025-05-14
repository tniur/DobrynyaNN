import Foundation
import DBRNetworking
import DBRCore

struct DBRAppointmentMapper {
    static func map(_ dto: DBRAppointmentDTO) -> DBRAppointment {
        DBRAppointment(
            id: dto.appointmentId,
            date: dto.date,
            time: dto.time,
            timeStart: dto.timeStart,
            timeEnd: dto.timeEnd,
            clinicId: dto.clinicId,
            doctorId: dto.doctorId,
            createdDate: dto.created,
            status: DBRAppointmentStatus(fromRawValue: dto.status)
        )
    }
}
