import ProjectDescription

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4hane"
let targetVersion = "15.0"

let more: Target = .target(
    name: "More",
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

let moreDemo: Target = .target(
    name: "MoreDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4hane.homeDemo",
    deploymentTargets: .iOS("15.0"),
//    infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
    sources: "Demo/Sources/**",
    dependencies: [
        .project(target: "More", path: .relativeToRoot("Projects/Features/More"))
    ]
)

let targets: [Target] = [
    more,
    moreDemo
]

let project = Project(
    name: "More",
    targets: targets
)
