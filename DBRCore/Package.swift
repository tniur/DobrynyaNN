// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBRCore",
    defaultLocalization: "ru",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBRCore",
            targets: ["DBRCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0")
    ],
    targets: [
        .target(
            name: "DBRCore",
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
    
)
