// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBRSplash",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBRSplash",
            targets: ["DBRSplash"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0"),
        .package(url: "https://github.com/hmlongco/Factory", from: "2.4.0"),
        .package(url: "https://github.com/hhru/Nivelir.git", from: "1.9.6")
    ],
    targets: [
        .target(
            name: "DBRSplash",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins"),
                .plugin(name: "Factory", package: "Factory"),
                .plugin(name: "Nivelir", package: "Nivelir")
            ]
        )
    ]
)
