import ProjectDescription

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4hane.calendar"
let targetVersion = "15.0"

let calendar: Target = .target(
    name: "Calendar",
    destinations: .iOS,
    product: .framework,
    bundleId: appBundleId,
    deploymentTargets: .iOS("15.0"),
//    infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
    sources: "Sources/**",
    resources: "Resources/**",
    dependencies: [
        .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
    ]
)

//let calendarDemo: Target = .target(
//    name: "CalendarDemo",
//    destinations: .iOS,
//    product: .app,
//    bundleId: "net.hejang.-4hane.calendarDemo",
//    deploymentTargets: .iOS("15.0"),
////    infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
//    sources: "Demo/Sources/**",
//    dependencies: [
//        .project(target: "Calendar", path: .relativeToRoot("Projects/Features/Calendar"))
//    ]
//)

let targets: [Target] = [
    calendar,
//    calendarDemo
]

let project = Project(
    name: "Calendar",
    targets: targets
)
