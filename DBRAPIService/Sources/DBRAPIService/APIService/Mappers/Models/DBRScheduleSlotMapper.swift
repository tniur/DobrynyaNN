import Foundation
import DBRNetworking
import DBRCore

struct DBRScheduleSlotMapper {
    static func map(_ dto: DBRScheduleSlotDTO) throws -> DBRScheduleSlot {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        guard let date = formatter.date(from: dto.date) else {
            throw DBRNetworkError.decodingError
        }

        return DBRScheduleSlot(
            date: date,
            timeStart: dto.timeStartShort,
            timeEnd: dto.timeEndShort,
            slotDateInterval: DBRSlotDateInterval(start: dto.timeStart, end: dto.timeEnd)
        )
    }
}
