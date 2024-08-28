import ProjectDescription
import ProjectDescriptionHelpers

let appTargetName = "HANE24"
let projectName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4HANE"

let appTargets: [Target] = [
    .target(
        name: appTargetName,
        destinations: [.iPhone],
        product: .app,
        bundleId: appBundleId,
        deploymentTargets: .iOS("15.0"),
        infoPlist: .extendingDefault(with: [
            "API_URL":"$(API_URL)",
            "UILaunchStoryboardName":"LaunchScreen.storyboard",
            "UIApplicationSupportsIndirectInputEvents":true,
            "CFBundleShortVersionString":"3.1.0",
            "UIApplicationSceneManifest":[
                "UIApplicationSupportsMultipleScenes":true,
                "UISceneConfigurations":[]
            ],
            "NSAppTransportSecurity":[
                "NSAllowsArbitraryLoads":true
            ],
            "UILaunchScreen":[
                "UIImageName":"LaunchLogo",
                "UIColorName":"launchScreenColor"
            ],
            "CFBundlePackageType":"APPL"
        ]),
        sources: "Sources/**",
        resources: [
            "Resources/**",
            "Resources/Assets.xcassets/**"
        ],
        entitlements: .file(path: .relativeToRoot("Supports/24HANE.entitlements")),
        dependencies: [
            .project(target: "Calendar", path: .relativeToRoot("Projects/Features/Calendar")),
            .project(target: "Home", path: .relativeToRoot("Projects/Features/Home")),
            .project(target: "More", path: .relativeToRoot("Projects/Features/More")),
            .project(target: "Login", path: .relativeToRoot("Projects/Features/Login")),
            .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
        ],
        settings: .settings(
            configurations: [
                .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/envDebug.xcconfig")),
                .release(name: "Release", xcconfig: .relativeToRoot("Supports/envRelease.xcconfig"))
            ])
    ),
    .widgetExtensionTarget()
]

let project = Project(
    name: projectName,
    organizationName: organizationName,
    settings: .settings(
        base: [:],
        configurations: [
            .debug(name: "Debug", xcconfig: .relativeToRoot("Supports/envDebug.xcconfig")),
            .release(name: "Release", xcconfig: .relativeToRoot("Supports/envRelease.xcconfig"))
        ]),
    targets: appTargets
)
