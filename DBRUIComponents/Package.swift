// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBRUIComponents",
    defaultLocalization: "ru",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBRUIComponents",
            targets: ["DBRUIComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", exact: "6.6.2")
    ],
    targets: [
        .target(
            name: "DBRUIComponents",
            exclude: [
                "../../swiftgen.yml"
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins"),
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        )
    ]
)
