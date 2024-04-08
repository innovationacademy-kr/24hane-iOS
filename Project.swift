import ProjectDescription

// MARK: Constants
// App Infomation
let projectName = "HANE24-App"
let organizationName = "Hane24-iOS"
let bundleID = "net.hejang.-4HANE"
let sourse = "../HANE24"
let targetVersion = "15.0"

let appTarget = Target(name:"HANE24-App",
   platform: .iOS,
   product: .app,
   bundleId: bundleID,
   deploymentTarget: .iOS(targetVersion: targetVersion, devices: [.iphone]),
   infoPlist: "HANE24/Info.plist",
   sources: ["HANE24/**"],
    dependencies: []
)

//let widgetTarget = Target(name: "WidgetExtension",
//        platform: .iOS,
//        product: .appExtension,
//        bundleId:  "net.hejang.-4HANE" + ".WidgetExtension",
//                          deploymentTarget: .iOS(targetVersion: "17.0", devices: [.iphone]),
//        infoPlist: .file(path: .relativeToRoot("WidgetExtension/Info.plist")),
//        sources: [.glob(.relativeToRoot("WidgetExtension/**"))],
//        resources: [.glob(pattern: .relativeToRoot("WidgetExtension/Resources/**"))],
//        entitlements: .relativeToRoot("Supporting Files/WidgetExtension.entitlements"),
//        dependencies: []
//)

let project = Project(
  name: projectName,
  organizationName: organizationName,
  targets: [
    appTarget,
  ]
)
