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
            clinicAddress: dto.clinicAddress,
            doctorId: dto.doctorId,
            doctorName: dto.doctorName,
            serviceId: dto.serviceId,
            serviceTitle: dto.serviceName,
            createdDate: dto.created,
            status: DBRAppointmentStatus(fromRawValue: dto.status)
        )
    }
}
