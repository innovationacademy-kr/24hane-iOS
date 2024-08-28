//
//  Modules.swift
//  Templates
//
//  Created by Katherine JANG on 7/1/24.
//

import ProjectDescription

public enum Modules: CaseIterable {
    case app
    case home
    case calendar
    case more
    case core
    case widget
}

extension Modules {
    var name: String {
        switch self {
        case .app:
            return "24HANEAPP"
        case .home:
            return "Home"
        case .calendar:
            return "Calendar"
        case .more:
            return "More"
        case .core:
            return "Core"
        case .widget:
            return "Widget"
        }
    }
    
    var bundleId: String {
        switch self {
        case .app:
            return "net.hejang.-4HANE"
        case .home:
            return "net.HANE24.Home"
        case .calendar:
            return "net.HANE24.Calendar"
        case .more:
            return "net.HANE24.More"
        case .core:
            return "net.HANE24.Core"
        case .widget:
            return "net.HANE24.Widget"
        }
    }
}

extension Modules {
    var targetDependency: ProjectDescription.TargetDependency {
        switch self {
        case .app:
            return TargetDependency.project(target: "", path: "")
        case .home:
            return TargetDependency.project(target: self.name, path: .relativeToRoot("Projects/Home"))
        case .calendar:
            return TargetDependency.project(target: self.name, path: .relativeToRoot("Projects/Calendar"))
        case .more:
            return TargetDependency.project(target: self.name, path: .relativeToRoot("Projects/More"))
        case .core:
            return TargetDependency.project(target: self.name, path: .relativeToRoot("Projects/Core"))
        case .widget:
            return TargetDependency.project(target: self.name, path: "Widget")
        }
    }
}

extension Modules {
    var dependencies:  [ProjectDescription.TargetDependency] {
        switch self {
        case .app:
            return []
        case .home:
            return [
                Modules.core.targetDependency
            ]
        case .calendar:
            return [
                Modules.core.targetDependency
            ]
        case .more:
            return [
                Modules.core.targetDependency
            ]
        case .core:
            return []
        case .widget:
            return [
                Modules.core.targetDependency
            ]
        }
    }
}
