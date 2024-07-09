import ProjectDescription

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.home"
let targetVersion = "15.0"

let home: Target = .target(
    name: "Home",
    destinations: .iOS,
    product: .framework,
    bundleId: appBundleId,
    deploymentTargets: .iOS("15.0"),
//    infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
    sources: "Sources/**",
    resources: [
        "Resources/**",
        "Resources/Assets.xcassets/**"
    ],
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ]
)

let homeDemo: Target = .target(
    name: "HomeDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4hane.homeDemo",
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
    sources: "Sources/**",
    resources: [
        "Resources/**",
        "Resources/Assets.xcassets/**"
    ],
    dependencies: [
        .project(target: "Home", path: .relativeToRoot("Projects/Features/Home"))
    ]
)

let targets: [Target] = [
    home,
    homeDemo
]

let project = Project(
    name: "Home",
    targets: targets
)
