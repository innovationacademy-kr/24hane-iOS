//
//  BackgroundTheme.swift
//  24HANE
//
//  Created by Katherine JANG on 6/18/24.
//

import SwiftUI

struct BackgroundTheme: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isInCluster: Bool = false
    
    var body: some View {
        if isInCluster {
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .opacity(0.7)
        } else {
            Theme.backgroundColor(forScheme: colorScheme)
                .edgesIgnoringSafeArea(colorScheme == .dark ? .all : .top)
        }
    }
}

#Preview {
    BackgroundTheme()
}
