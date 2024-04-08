import ProjectDescription

// MARK: Constants
// App Infomation
let projectName = "HANE24"
let organizationName = "Hane24-iOS"
let bundleID = "net.hejang.-4HANE"
let targetVersion = "15.0"

// Widget Infomation
let widgetProjectName = "HANE24WidgetExtension"
let widgetBundleID = "net.hejang.-4HANE.HANE24Widget"
let widgetSourse = "HANE24Widget"
let widgetTargetVersion = "17.0"

let appTarget = Target(
	name: projectName,
	platform: .iOS,
	product: .app,
	bundleId: bundleID,
	sources: ["\(projectName)/**"]
)

let widgetTarget = Target(
	name: widgetProjectName,
	platform: .iOS,
	product: .app,
	bundleId: widgetBundleID,
	sources: ["\(widgetSourse)/**"]
)

// MARK: Struct
let appProject = Project(
	name: projectName,
	organizationName: organizationName,
	packages: [],
	settings: nil,
	targets: [
		appTarget
	]
)

let widgetProject = Project(
	name: projectName,
	organizationName: organizationName,
	packages: [],
	settings: nil,
	targets: [
		widgetTarget
	]
)

let workspace = Workspace(
	name: "HANE24", 
	projects: [
		"*/**"
	]
)

