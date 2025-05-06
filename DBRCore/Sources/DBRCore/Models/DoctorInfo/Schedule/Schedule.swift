import Foundation

public struct Schedule: Sendable {
    private let slots: [Date: [ScheduleSlot]]

    public init(slots: [ScheduleSlot]) {
        let calendar = Calendar.current
        self.slots = Dictionary(grouping: slots, by: { calendar.startOfDay(for: $0.date) })
    }

    public func slots(for date: Date) -> [ScheduleSlot] {
        let calendar = Calendar.current
        return slots[calendar.startOfDay(for: date)] ?? []
    }
}
