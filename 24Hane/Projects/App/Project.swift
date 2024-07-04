import ProjectDescription

let name = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4hane.app"

let targets: [Target] = [
    .target(
        name: name,
        destinations: .iOS,
        product: .app,
        bundleId: appBundleId,
        deploymentTargets: .iOS("15.0"),
        infoPlist: .extendingDefault(with: [
            "API_URL":"$(API_URL)",
            "UILaunchScreen":[
                "UIImageName":""
            ]
        ]),
        sources: "Sources/**",
        entitlements: .file(path: .relativeToRoot("Supports/24HANE.entitlements")),
        dependencies: [
            .project(target: "Calendar", path: .relativeToRoot("Projects/Features/Calendar")),
            .project(target: "Home", path: .relativeToRoot("Projects/Features/Home")),
            .project(target: "More", path: .relativeToRoot("Projects/Features/More")),
            .project(target: "Login", path: .relativeToRoot("Projects/Features/Login"))
        ],
        settings: .settings(
            configurations: [
                .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
                .release(name: "Release", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
            ])
    )
]

let project = Project(
    name: name,
    organizationName: organizationName,
    settings: .settings(
        base: [:],
        configurations: [
            .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
            .release(name: "Release", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
        ]),
    targets: targets
)
