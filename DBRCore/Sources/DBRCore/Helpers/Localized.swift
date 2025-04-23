import Foundation

public enum Localized {
    private static var bundle: Bundle {
        Bundle.module
    }

    public static func string(_ key: String) -> String {
        return NSLocalizedString(
            key,
            bundle: bundle,
            value: "**\(key)**",
            comment: ""
        )
    }
}
