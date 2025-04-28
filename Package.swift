// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "MerseysideBusBackend",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "MerseysideBusBackend",
            targets: ["MerseysideBusBackend"]
        ),
    ],
    dependencies: [
        // No external packages needed now
    ],
    targets: [
        .target(
            name: "MerseysideBusBackend",
            dependencies: [],
            path: "Sources",
            resources: [
                .copy("../Resources/BusStopsSuper.json") // Load BusStopsSuper.json into your bundle
            ]
        ),
        .testTarget(
            name: "BusTests",
            dependencies: ["MerseysideBusBackend"],
            path: "Tests/BusTests"
        )
    ]
)
