import Foundation

public struct ScheduleSlotDTO: Codable, Sendable {
    public let clinicId: Int
    public let date: String
    public let timeStart: String
    public let timeStartShort: String
    public let timeEnd: String
    public let timeEndShort: String
    public let room: String
    public let isBusy: Bool

    private enum CodingKeys: String, CodingKey {
        case date, room
        case clinicId = "clinic_id"
        case timeStart = "time_start"
        case timeStartShort = "time_start_short"
        case timeEnd = "time_end"
        case timeEndShort = "time_end_short"
        case isBusy = "is_busy"
    }
}
