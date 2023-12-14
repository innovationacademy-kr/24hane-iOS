//
//  RoundedRectangleModifier.swift
//  24HANE
//
//  Created by Katherine JANG on 12/14/23.
//

import SwiftUI

struct RoundedRectangleForGrid: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(backgroundColor)
            .overlay {
                
            }
    }
}
 
