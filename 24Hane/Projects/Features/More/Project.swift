import ProjectDescription

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.more"
let targetVersion = "15.0"

let more: Target = .target(
    name: "More",
    destinations: .iOS,
    product: .framework,
    bundleId: appBundleId,
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: ["API_URL":"$(API_URL)"]),
    sources: ["Sources/**", "Resources/**"],
    resources: ["Resources/**", "Sources/**"],
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ],
    settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
        .release(name: "Release", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
    ])
)

let moreDemo: Target = .target(
    name: "MoreDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4hane.moreDemo",
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: [
        "API_URL":"$(API_URL)",
        "UILaunchScreen":[
            "UIImageName":""
        ]
    ]),
    sources: "Demo/Sources/**",
    dependencies: [
        .project(target: "More", path: .relativeToRoot("Projects/Features/More")),
        .project(target: "Login", path: .relativeToRoot("Projects/Features/Login"))
    ],
    settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
        .release(name: "Release", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
    ])
)

let targets: [Target] = [
    more,
    moreDemo
]

let project = Project(
    name: "More",
    targets: targets
)
