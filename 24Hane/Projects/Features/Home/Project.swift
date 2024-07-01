import ProjectDescription
import ProjectDescriptionHelpers

let homeTarget = Target.target(
    name: "Home",
    destinations: .iOS,
    product: .framework,
    bundleId: "net.hejang.-4HANE.home",
    deploymentTargets: .iOS("15.0"),
//    infoPlist:  "./HANE24/Info.plist",
    sources: ["./Sources/**"],
//    resources: ["../Resources/**"],
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ]
)


let homeDemoTarget = Target.target(
    name: "HomeDemo",
    destinations: .iOS,
    product: .app,
    bundleId: "net.hejang.-4HANE.homeDemo",
    deploymentTargets: .iOS("15.0"),
//    infoPlist:  "./HANE24/Info.plist",
    sources: ["./Sources/**"],
//    resources: ["../Resources/**"],
    dependencies: [
        .project(target: "Home", path: .relativeToRoot("Projects/Features/Home"))
    ]
)


let project = Project.app(target: homeTarget)
