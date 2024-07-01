//
//  DarkMode.swift
//  HANE24
//
//  Created by Katherine JANG on 2/17/23.
//

import Foundation
import SwiftUI

public struct Theme {
    static func backgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightBG = Color(hex: "F5F5F5")
        let darkBG = Color(hex: "333333")

        switch scheme {
        case .light: return lightBG
        case .dark: return darkBG
        @unknown default: return lightBG
        }
    }

    public static func calendarBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightBG = Color.white
        let darkBG = Color(hex: "333333")

        switch scheme {
        case .light: return lightBG
        case .dark: return darkBG
        @unknown default: return lightBG
        }
    }

    static func textGrayColor(forScheme scheme: ColorScheme) -> Color {
        let lightText = Color(hex: "707070")
        let darkText = Color(hex: "EAEAEA")

        switch scheme {
        case .light: return lightText
        case .dark: return darkText
        @unknown default: return lightText
        }
    }

    static func toolBarIconColor(forScheme scheme: ColorScheme) -> Color {
        let lightIcon = Color(hex: "5B5B5B")
        let darkIcon = Color.white

        switch scheme {
        case .light: return lightIcon
        case .dark: return darkIcon
        @unknown default: return lightIcon
        }
    }
}
