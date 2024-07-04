import ProjectDescription

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.calendar"
let targetVersion = "15.0"

let calendar: Target = .target(
    name: "Calendar",
    destinations: .iOS,
    product: .framework,
    bundleId: appBundleId,
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: ["API_URL":"$(API_URL)"]),
    sources: "Sources/**",
    resources: "Resources/**",
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ],
    settings: .settings(configurations: [
        .debug(name: "calendarDebugSetting", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
        .release(name: "calendarReleaseSetting", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
    ])
)

let calendarDemo: Target = .target(
    name: "CalendarDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4hane.calendarDemo",
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: ["API_URL":"$(API_URL)"]),
    sources: "Demo/Sources/**",
    dependencies: [
        .project(target: "Calendar", path: .relativeToRoot("Projects/Features/Calendar"))
    ],
    settings: .settings(configurations: [
        .debug(name: "calendarDemoDebugSetting", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
        .release(name: "calendarDemoReleaseSetting", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
    ])
)

let targets: [Target] = [
    calendar,
    calendarDemo
]

let project = Project(
    name: "Calendar",
    targets: targets
)
