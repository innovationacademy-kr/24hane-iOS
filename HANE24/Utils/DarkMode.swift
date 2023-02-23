//
//  DarkMode.swift
//  HANE24
//
//  Created by Katherine JANG on 2/17/23.
//

import Foundation
import SwiftUI

//extension Color{
//    static let textGray = Color(hex: "9B9797")
//    static let chartDetailBG = Color(hex: "333333")
//    static let gradientBlue = Color(hex : "8EF2F3")
//    static let gradientPurple = Color (hex: "735BF2")
//    static let LightDefaultBG = Color(hex: "F5F5F5")
//    static let iconColor = Color(hex: "5B5B5B")
//    static let textGrayMoreView = Color(hex: "707070")
//    static let gradientWhtie = Color (hex : "A3D1EC")
//    static let calendarColorLv1 = Color(hex : "F1EFFE")
//    static let calendarColorLv2 = Color(hex : "D5CEFB")
//    static let calendarColorLv3 = Color(hex : "B9ADF9")
//    static let calendarColorLv4 = Color(hex : "9D8CF6")
//
//    static let DarkDefaultBG = Color(hex: "333333")
//}


struct Theme {
    
    
    
    static func BackgoundColor(forScheme scheme: ColorScheme) -> Color {
       let lightBG = Color(hex: "F5F5F5")
        let darkBG = Color(hex: "333333")
        
        switch scheme {
        case .light : return lightBG
        case .dark  : return darkBG
        @unknown default: return lightBG
        }
    }
    
    static func CalendarBackgoundColor(forScheme scheme: ColorScheme) -> Color {
        let lightBG = Color.white
        let darkBG = Color(hex: "333333")
        
        switch scheme {
        case .light : return lightBG
        case .dark  : return darkBG
        @unknown default: return lightBG
        }
    }
    
    
    static func TextGrayColor(forScheme scheme: ColorScheme) -> Color {
        let lightText = Color(hex: "707070")
         let darkText = Color(hex: "EAEAEA")
         
         switch scheme {
         case .light : return lightText
         case .dark  : return darkText
         @unknown default: return lightText
         }
    }
    
    static func ToolBarIconColor(forScheme scheme: ColorScheme) -> Color {
        let lightIcon = Color(hex: "5B5B5B")
        let darkIcon = Color.white
         
         switch scheme {
         case .light : return lightIcon
         case .dark  : return darkIcon
         @unknown default: return lightIcon
         }
    }
    
}
