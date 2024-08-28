//
//  TapbarBackButton.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI
import HaneCore

struct Tapbar: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Theme.toolBarIconColor(forScheme: colorScheme))
                        .imageScale(.large)
                        .padding()
                })
                Spacer()
            }
            Text("카드 재발급 신청")
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.bottom, 15)
    }
}
