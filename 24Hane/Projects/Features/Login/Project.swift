import ProjectDescription


let login: Target = .target(
    name: "Login",
    destinations: .iOS,
    product: .framework,
    bundleId: "net.hejang.-4hane.login",
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
//    resources: ["Resources/**"],
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
    dependencies: [
        .project(target: "Login", path: .relativeToRoot("Projects/Features/Login"))
    ]
)

let targets: [Target] = [
    login,
//    loginDemo
]

let project = Project(
    name: "Login",
    targets: targets
)
