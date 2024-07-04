import ProjectDescription

let name = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4hane"
let targetVersion = "15.0"

let targets: [Target] = [
    .target(
        name: name,
        destinations: .iOS,
        product: .app,
        bundleId: appBundleId,
        infoPlist: .extendingDefault(with: ["API_URL":"$(API_URL)"]),
        sources: "Sources/**",
        entitlements: .file(path: .relativeToRoot("Supports/24HANE.entitlements")),
        dependencies: [
            .project(target: "Calendar", path: .relativeToRoot("Projects/Features/Calendar")),
            .project(target: "More", path: .relativeToRoot("Projects/Features/More"))
        ],
        settings: .settings(configurations: [
            .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
            .release(name: "Release", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
        ])
    )
]

let project = Project(
    name: name,
    organizationName: organizationName,
    targets: targets
)
