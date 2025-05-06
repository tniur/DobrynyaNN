import Foundation
import DBRCore

struct ScheduleSlotMapper {
    static func map(_ dto: ScheduleSlotDTO) throws -> ScheduleSlot {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        guard let date = formatter.date(from: dto.date) else {
            throw NetworkError.decodingError
        }

        return ScheduleSlot(
            date: date,
            timeStart: dto.timeStartShort,
            timeEnd: dto.timeEndShort,
            slotDateInterval: SlotDateInterval(start: dto.timeStart, end: dto.timeEnd)
        )
    }
}
