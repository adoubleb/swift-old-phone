// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "GoodAsOldPhones",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "GoodAsOldPhones",
            targets: ["GoodAsOldPhones"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GoodAsOldPhones",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "GoodAsOldPhonesTests",
            dependencies: ["GoodAsOldPhones"]),
    ]
)

