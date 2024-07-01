import ProjectDescription
import ProjectDescriptionHelpers

let logInTarget = Target.target(
    name: "LogIn",
    destinations: .iOS,
    product: .framework,
    bundleId: "net.hejang.-4HANE.LogIn",
    deploymentTargets: .iOS("15.0"),
//    infoPlist:  "./HANE24/Info.plist",
    sources: ["Sources/**"],
//    resources: ["../Resources/**"],
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ]
)


let logInDemoTarget = Target.target(
    name: "LogInDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4HANE.LogIn.Demo",
    deploymentTargets: .iOS("15.0"),
//    infoPlist:  "./HANE24/Info.plist",
    sources: ["Sources/**"],
//    resources: ["../Resources/**"],
    dependencies: [
        .project(target: "LogIn", path: .relativeToRoot("Projects/Features/LogIn"))
    ]
)


let project = Project.app(target: logInTarget)
