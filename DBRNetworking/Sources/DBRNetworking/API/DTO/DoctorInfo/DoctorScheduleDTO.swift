import Foundation
import DBRCore

public struct DoctorScheduleDTO: Codable, Sendable {
    let clinicId: Int
    let date: String
    let timeStart: String
    let timeStartShort: String
    let timeEnd: String
    let timeEndShort: String
    let room: String
    let isBusy: Bool

    private enum CodingKeys: String, CodingKey {
        case date, room
        case clinicId = "clinic_id"
        case timeStart = "time_start"
        case timeStartShort = "time_start_short"
        case timeEnd = "time_end"
        case timeEndShort = "time_end_short"
        case isBusy = "is_busy"
    }

    func toDomain() -> DoctorSchedule {
        DoctorSchedule(
            clinicId: clinicId,
            date: date,
            timeStart: timeStart,
            timeStartShort: timeStartShort,
            timeEnd: timeEnd,
            timeEndShort: timeEndShort,
            room: room,
            isBusy: isBusy
        )
    }
}
