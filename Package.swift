import PackageDescription

let package = Package(
    name: "XCFit",
    targets: [
    Target(name: "xcfittool", dependencies: ["XCFit"])
    ]
)
