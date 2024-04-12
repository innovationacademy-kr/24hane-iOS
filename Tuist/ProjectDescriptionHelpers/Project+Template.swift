import ProjectDescription

public extension Project {
	static func app() {}

	static func framework() {}

	static func target() {}

}

//public let widgetTarget = Target(
//	name: "HANE24Widget",
//	platform: .iOS,
//	product: .appExtension,
//	bundleId:  bundleID + ".WidgetExtension",
//	deploymentTarget: .iOS(targetVersion: "17.0", devices: [.iphone]),
//	infoPlist: .file(path: .relativeToRoot("HANE24Widget/Info.plist")),
//	sources: [.glob(.relativeToRoot("HANE24Widget/**"))],
//	//                    resources: [.glob(pattern: .relativeToRoot("WidgetExtension/Resources/**"))],
//	//                    entitlements: .relativeToRoot("HANE24Widget/HANE24WidgetExtension.entitlements"),
//	dependencies: [])
//
//
//public extension Project {
//
//	static func generateTarget(
//		name: String,
//		product: Product,
//		bundleID: String,
//		//        schemes: [Scheme] = [],
//		deploymentTarget: ProjectDescription.DeploymentTarget? = nil,
//		infoPlist: ProjectDescription.InfoPlist? = .default,
//		dependencies: [TargetDependency] = [],
//		resources: ProjectDescription.ResourceFileElements? = nil
//	) -> Target {
//		return Target(
//			name: name,
//			platform: .iOS,
//			product: product,
//			bundleId: bundleID,
//			deploymentTarget: deploymentTarget,
//			infoPlist: infoPlist,
//			sources: ["Sources/**"],
//			//			resources: resources,
//			dependencies: dependencies
//		)
//	}
//
//	static func project(
//		name: String,
//		product: Product,
//		bundleID: String,
//		schemes: [Scheme] = [],
//		dependencies: [TargetDependency] = [],
//		resources: ProjectDescription.ResourceFileElements? = nil,
//		target: [Target] = []
//	) -> Project {
//		return Project(
//			name: name,
//			targets: target,
//			schemes: [
//				Scheme(
//					name: name,
//					shared: true,
//					buildAction: BuildAction(
//						targets: [
//							TargetReference(projectPath: nil, target: name)
//						]
//					),
//					testAction: .targets(
//						["\(name)Tests"],
//						configuration: .debug,
//						options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
//					)
//				)
//			]
//		)
//	}
//
//	static func app(
//		name: String,
//		dependencies: [TargetDependency] = [],
//		resources: ProjectDescription.ResourceFileElements? = nil,
//		target: Target = widgetTarget
//	) -> Project {
//		return self.project(
//			name: name,
//			product: .app,
//			bundleID: "\(bundleID).\(name)",
//			dependencies: dependencies,
//			//            resources: resourct
//			target: [
//				generateTarget(
//					name: name,
//					product: .app,
//					bundleID: "\(bundleID).\(name)",
//					deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
//					infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist"))),
//				generateTarget(
//					name: "\(name)Tests",
//					product: .unitTests,
//					bundleID: "\(bundleID).\(name)",
//					deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
//					infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
//					dependencies: [
//						.target(name: name)]), widgetTarget]
//		)
//	}
//
//	static func makeFramework(
//		name: String,
//		dependencies: [TargetDependency] = [],
//		resources: ProjectDescription.ResourceFileElements? = nil
//	) -> Project {
//		return .project(
//			name: name,
//			product: .framework,
//			bundleID: "\(bundleID).\(name)",
//			target: [
//				generateTarget(
//					name: name,
//					product: .framework,
//					bundleID: "\(bundleID).\(name)",
//					deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
//					infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
//					dependencies: dependencies,
//					resources: .default
//				),
//				generateTarget(
//					name: "\(name)Tests",
//					product: .unitTests,
//					bundleID: "\(bundleID).\(name)",
//					deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
//					infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
//					dependencies: [
//						.target(name: name)
//					],
//					resources: .default
//				)
//			]
//		)
//	}
//
//	static func framework(
//		name: String,
//		dependencies: [TargetDependency] = [],
//		resources: ProjectDescription.ResourceFileElements? = nil
//	) -> Project {
//		return .project(
//			name: name,
//			product: .framework,
//			bundleID: "\(bundleID).\(name)",
//			target: [
//				generateTarget(
//					name: name,
//					product: .app,
//					bundleID: "\(bundleID).\(name)",
//					deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
//					infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
//					dependencies: dependencies,
//					resources: .default
//				),
//				generateTarget(
//					name: "\(name)Tests",
//					product: .unitTests,
//					bundleID: "\(bundleID).\(name)",
//					deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
//					infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
//					dependencies: [
//						.target(name: name)
//					],
//					resources: .default
//				)
//			]
//		)
//	}
//
//	static func appExtension(
//		name: String,
//		dependencies: [TargetDependency] = [],
//		resources: ProjectDescription.ResourceFileElements? = nil
//	) -> Project {
//		return .project(
//			name: name,
//			product: .appExtension,
//			bundleID: bundleID + ".WidgetExtension",
//			target: [
//				generateTarget(
//					name: name,
//					product: .app,
//					bundleID: bundleID,
//					deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
//					infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist"))
//				)
//			]
//		)
//	}
//}
//
//public extension ProjectDescription.ResourceFileElements {
//
//	static let `default`: ProjectDescription.ResourceFileElements = ["Resources/**"]
//
//}
