//
//  LaunchScreen.swift
//  HANE24
//
//  Created by Katherine JANG on 2/23/23.
//

import SwiftUI
import HaneCore

struct LaunchScreen: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack(alignment: .center) {
            Theme.BackgoundColor(forScheme: colorScheme)
                .edgesIgnoringSafeArea(.all)
            Image(colorScheme == .light ? "LaunchScreen_light" : "LaunchScreen_dark")
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    LaunchScreen()
}
