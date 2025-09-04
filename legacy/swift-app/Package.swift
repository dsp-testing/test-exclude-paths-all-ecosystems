// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "LegacySwiftApp",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.5.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.3.0")
    ],
    targets: [
        .executableTarget(
            name: "LegacySwiftApp",
            dependencies: ["Alamofire", "SwiftyJSON"]
        )
    ]
)
