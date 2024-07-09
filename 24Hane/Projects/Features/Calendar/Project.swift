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
    resources: [
        "Resources/**",
        "Resources/Assets.xcassets/**"
    ],
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ],
    settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
        .release(name: "Release", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
    ])
)

let calendarDemo: Target = .target(
    name: "CalendarDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4hane.calendarDemo",
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: [
        "API_URL":"$(API_URL)",
        "NSAppTransportSecurity":[
            "NSAllowsArbitraryLoads":"YES"
        ],
        "UILaunchScreen":[
            "UIImageName":""
        ]
    ]),
    sources: "Demo/Sources/**",
    resources: [
        "Resources/**",
        "Resources/Assets.xcassets/**"
    ],
    dependencies: [
        .project(target: "Calendar", path: .relativeToRoot("Projects/Features/Calendar")),
        .project(target: "Login", path: .relativeToRoot("Projects/Features/Login")),
        .project(target: "Home", path: .relativeToRoot("Projects/Features/Home"))
    ],
    settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/env.xcconfig")),
        .release(name: "Release", xcconfig: .relativeToRoot("Supports/env.xcconfig"))
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
