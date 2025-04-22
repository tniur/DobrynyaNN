// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBRDIContainer",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBRDIContainer",
            targets: ["DBRDIContainer"]),
    ],
    targets: [
        .target(
            name: "DBRDIContainer"),
    ]
)
