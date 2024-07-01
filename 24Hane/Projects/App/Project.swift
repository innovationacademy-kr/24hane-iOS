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
//        infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
        dependencies: [
            .project(target: "Home", path: .relativeToRoot("Projects/Features/Home")),
            .project(target: "Calendar", path: .relativeToRoot("Projects/Features/Calendar"))
        ]
    )
]

let project = Project(
    name: name,
    organizationName: organizationName,
    targets: targets
)
