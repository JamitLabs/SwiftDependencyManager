// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftDependencyManager",
    products: [
        .executable(name: "sdm", targets: ["SwiftDependencyManager"]),
        .library(name: "SwiftDependencyManagerKit", type: .dynamic, targets: ["SwiftDependencyManagerKit"]),
        .library(name: "CartfileToPackageManifest", type: .dynamic, targets: ["CartfileToPackageManifest"]),
        .library(name: "PodspecToPackageManifest", type: .dynamic, targets: ["PodspecToPackageManifest"]),
        .library(name: "PackageManifest", type: .dynamic, targets: ["PackageManifest"])
    ],
    dependencies: [
        .package(url: "https://github.com/kiliankoe/CLISpinner.git", .upToNextMinor(from: "0.3.5")),
        .package(url: "https://github.com/Flinesoft/HandySwift.git", .upToNextMajor(from: "2.6.0")),
        .package(url: "https://github.com/onevcat/Rainbow.git", .upToNextMajor(from: "3.1.4")),
        .package(url: "https://github.com/jakeheis/SwiftCLI", .upToNextMajor(from: "5.1.2")),
        .package(url: "https://github.com/tuist/xcodeproj.git", .upToNextMajor(from: "6.1.0"))
    ],
    targets: [
        .target(
            name: "SwiftDependencyManager",
            dependencies: ["SwiftDependencyManagerKit"]
        ),
        .target(
            name: "SwiftDependencyManagerKit",
            dependencies: [
                "CartfileToPackageManifest",
                "CLISpinner",
                "HandySwift",
                "PodspecToPackageManifest",
                "Rainbow",
                "SwiftCLI",
                "xcodeproj"
            ]
        ),
        .testTarget(
            name: "SwiftDependencyManagerKitTests",
            dependencies: ["SwiftDependencyManagerKit", "HandySwift"]
        ),
        .target(
            name: "CartfileToPackageManifest",
            dependencies: ["HandySwift", "PackageManifest"]
        ),
        .testTarget(
            name: "CartfileToPackageManifestTests",
            dependencies: ["HandySwift"]
        ),
        .target(
            name: "PodspecToPackageManifest",
            dependencies: ["HandySwift", "PackageManifest"]
        ),
        .testTarget(
            name: "PodspecToPackageManifestTests",
            dependencies: ["HandySwift"]
        ),
        .target(
            name: "PackageManifest",
            dependencies: ["HandySwift"]
        ),
        .testTarget(
            name: "PackageManifestTests",
            dependencies: ["HandySwift"]
        )
    ]
)
