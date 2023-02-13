//
//  ColorExtension.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import Foundation
import SwiftUI

extension Color{
    static let textGray = Color(hex: "9B9797")
    static let chartDetailBG = Color(hex: "333333")
    static let gradientBlue = Color(hex : "8EF2F3")
    static let gradientPurple = Color (hex: "735BF2")
    static let defaultBG = Color(hex: "F5F5F5")
}

extension Color{
    
    init(hex:String){
        let scanner = Scanner(string:hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue:b)
    }
}
