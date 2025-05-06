import Foundation

public struct ScheduleSlot: Sendable, Identifiable {
    public let id: UUID
    public let date: Date
    public let timeStart: String
    public let timeEnd: String
    public let slotDateInterval: SlotDateInterval

    public init(id: UUID = UUID(), date: Date, timeStart: String, timeEnd: String, slotDateInterval: SlotDateInterval) {
        self.id = id
        self.date = date
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.slotDateInterval = slotDateInterval
    }
}
