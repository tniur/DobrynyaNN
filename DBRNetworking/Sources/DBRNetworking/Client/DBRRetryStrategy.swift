import Foundation

public struct DBRRetryStrategy {
    public let maxAttempts: Int
    public let baseDelay: TimeInterval
    public let jitter: Bool

    public init(maxAttempts: Int = 3, baseDelay: TimeInterval = 0.5, jitter: Bool = true) {
        self.maxAttempts = maxAttempts
        self.baseDelay = baseDelay
        self.jitter = jitter
    }

    public func delay(for attempt: Int) -> TimeInterval {
        let exponential = baseDelay * pow(2.0, Double(attempt - 1))
        guard jitter else { return exponential }
        let jitterValue = Double.random(in: 0...(exponential / 2))
        return exponential + jitterValue
    }
}
