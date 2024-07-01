import ProjectDescription

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4hane"
let targetVersion = "15.0"

let login: Target = .target(
    name: "Login",
    destinations: .iOS,
    product: .framework,
    bundleId: appBundleId,
    deploymentTargets: .iOS("15.0"),
//    infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
    sources: ["Sources/**", "Resources/**"],
    resources: ["Resources/**", "Sources/**"],
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ]
)

let loginDemo: Target = .target(
    name: "LoginDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4hane.loginDemo",
    deploymentTargets: .iOS("15.0"),
//    infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
    sources: "Demo/Sources/**",
    dependencies: [
        .project(target: "Login", path: .relativeToRoot("Projects/Features/Login"))
    ]
)

let targets: [Target] = [
    login,
    loginDemo
]

let project = Project(
    name: "Login",
    targets: targets
)
