//
//  AccTimeCardsView.swift
//  24HANE
//
//  Created by Hosung Lim on 5/9/24.
//

import SwiftUI

struct AccumulationTotalTimeView: View {
    @Environment(\.colorScheme) var colorScheme
    var totalAccTime: Int64

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.chartDetailBG)
                .overlay(
                    colorScheme == .dark ?
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 2)
                    : nil
                )
                .shadow(
                    color: .black.opacity(0.25),
                    radius: 5,
                    x: 0, y: 6
                )
            
            Text("총 \(totalAccTime / 3600 )시간 \(totalAccTime % 3600 / 60)분")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}
