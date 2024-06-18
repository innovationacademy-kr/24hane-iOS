//
//  RotateChevronModifier.swift
//  24HANE
//
//  Created by Katherine JANG on 6/18/24.
//

import SwiftUI

struct ChevronModifier: ViewModifier {
    var pointDown: Bool

    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(Color(hex: "#9B9797"))
            .rotationEffect(pointDown ? Angle(degrees: 0) : Angle(degrees: 90))
            .frame(width: 24, height: 24)
    }
}

extension View {
    func chevronStyle(pointDown: Bool) -> some View {
        self.modifier(ChevronModifier(pointDown: pointDown))
    }
}
