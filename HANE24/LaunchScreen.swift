//
//  LaunchScreen.swift
//  HANE24
//
//  Created by Katherine JANG on 2/23/23.
//

import SwiftUI

struct LaunchScreen: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack(alignment: .center){
            Theme.BackgoundColor(forScheme: colorScheme)
                .ignoresSafeArea()
            Image(colorScheme == .light ? "LaunchLogo" : "LaunchLogoDark")
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
