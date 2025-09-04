// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "MainSwiftApp",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0")
    ],
    targets: [
        .executableTarget(
            name: "MainSwiftApp",
            dependencies: ["Alamofire", "SwiftyJSON"]
        )
    ]
)
