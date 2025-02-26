// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBHomeScreenExample",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBHomeScreenExample",
            targets: ["DBHomeScreenExample"]),
    ],
    dependencies: [
        .package(path: "../DBUIComponents"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0"),
        .package(url: "https://github.com/hhru/Nivelir.git", from: "1.9.6")
    ],
    targets: [
        .target(
            name: "DBHomeScreenExample",
            dependencies: [
                .product(name: "DBUIComponents", package: "DBUIComponents"),
                .product(name: "Nivelir", package: "Nivelir")
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
)
