// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RKCalendar",
    
    platforms: [
        .macOS(.v10_13),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "RKCalendar",
            targets: ["RKCalendar"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "RKCalendar",
            dependencies: []),
        .testTarget(
            name: "RKCalendarTests",
            dependencies: ["RKCalendar"]),
    ]
)
