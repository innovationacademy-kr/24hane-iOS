import ProjectDescription
import ProjectDescriptionHelpers

let appName = "HANE24"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4hane.calendar"
let targetVersion = "15.0"

var calendarFramework: Target = .framework(module: .calendar)
var calendarDemo: Target = .demoApp(module: .calendar)

let targets: [Target] = [
    calendarFramework,
    calendarDemo
]

let project = Project(
    name: "Calendar",
    targets: targets
)
