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
        ZStack{
            Theme.BackgoundColor(forScheme: colorScheme)
                .edgesIgnoringSafeArea(colorScheme == .dark ? .all : .top)
            VStack{
                Text("24")
                HStack{
                    Text("Hours")
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 20, height: 20)
                }
                
                Text("Are")
                Text("Not")
                Text("Enough")
            }
            .font(.system(size: 20, weight: .heavy, design: .monospaced))
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
