import ProjectDescription

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.home"
let targetVersion = "15.0"

let home: Target = .target(
    name: "Home",
    destinations: [.iPhone],
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
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core")),
        .project(target: "Login", path: .relativeToRoot("Projects/Features/Login"))
    ],
    settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/envDebug.xcconfig")),
        .release(name: "Release", xcconfig: .relativeToRoot("Supports/envRelease.xcconfig"))
    ])
)

let homeDemo: Target = .target(
    name: "HomeDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4hane.homeDemo",
    deploymentTargets: .iOS("15.0"),
    infoPlist: .extendingDefault(with: [
        "API_URL":"$(API_URL)",
        "UILaunchStoryboardName":"LaunchScreen.storyboard",
        "UIApplicationSupportsIndirectInputEvents":true,
        "UIApplicationSceneManifest":[
            "UIApplicationSupportsMultipleScenes":true,
            "UISceneConfigurations":[]
        ],
        "NSAppTransportSecurity":[
            "NSAllowsArbitraryLoads":true
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
        .project(target: "Home", path: .relativeToRoot("Projects/Features/Home")),
        .project(target: "Login", path: .relativeToRoot("Projects/Features/Login")),
    ],
    settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/envDebug.xcconfig")),
        .release(name: "Release", xcconfig: .relativeToRoot("Supports/envRelease.xcconfig"))
    ])
)

let homeTest: Target = .target(
    name: "HomeTest",
    destinations: .iOS,
    product: .unitTests,
    bundleId: "net.hejang.-4hane.homeTest",
    deploymentTargets: .iOS("15.0"),
    infoPlist: .default,
    sources: "Test/Sources/**",
    dependencies: [
        .project(target: "Home", path: .relativeToRoot("Projects/Features/Home")),
    ]
)

let targets: [Target] = [
    home,
    homeDemo,
    homeTest
]

let project = Project(
    name: "Home",
    targets: targets
)
