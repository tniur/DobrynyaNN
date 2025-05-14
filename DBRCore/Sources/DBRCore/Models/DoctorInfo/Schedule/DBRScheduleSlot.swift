import Foundation

public struct DBRScheduleSlot: Sendable, Identifiable {
    public let id: UUID
    public let date: Date
    public let timeStart: String
    public let timeEnd: String
    public let slotDateInterval: DBRSlotDateInterval

    public init(
        id: UUID = UUID(),
        date: Date,
        timeStart: String,
        timeEnd: String,
        slotDateInterval: DBRSlotDateInterval
    ) {
        self.id = id
        self.date = date
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.slotDateInterval = slotDateInterval
    }
}
