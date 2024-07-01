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
    case utils
    case network
    case error
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
        case .utils:
            return "HaneUtils"
        case .network:
            return "NetworkManager"
        case .error:
            return "HaneError"
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
        case .utils:
            return "net.HANE24.Utils"
        case .network:
            return "net.HANE24.Network"
        case .error:
            return "net.HANE24.Error"
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
            return TargetDependency.project(target: self.name, path: "../Home")
        case .calendar:
            return TargetDependency.project(target: self.name, path: "../Calendar")
        case .more:
            return TargetDependency.project(target: self.name, path: "../More")
        case .utils:
            return TargetDependency.project(target: self.name, path: "../HaneUtils")
        case .network:
            return TargetDependency.project(target: self.name, path: "NetworkManage")
        case .error:
            return TargetDependency.project(target: self.name, path: "HaneError")
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
            return [Modules.utils.targetDependency,
                    Modules.network.targetDependency,
                    Modules.error.targetDependency]
        case .calendar:
            return [Modules.utils.targetDependency,
                    Modules.network.targetDependency,
                    Modules.error.targetDependency]
        case .more:
            return [Modules.utils.targetDependency,
                    Modules.network.targetDependency,
                    Modules.error.targetDependency]
        case .utils:
            return []
        case .network:
            return [Modules.error.targetDependency]
        case .error:
            return [Modules.utils.targetDependency,
                    Modules.network.targetDependency,
                    Modules.error.targetDependency]
        case .widget:
            return [Modules.utils.targetDependency,
                    Modules.network.targetDependency,
                    Modules.error.targetDependency]
        }
    }
}
