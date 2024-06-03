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

struct AccumulationValidTimeView: View {
    @Environment(\.colorScheme) var colorScheme
    var validAccTime: Int64

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gradientPurple)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gradientPurple, lineWidth: 3)
                        .shadow(
                            color: .chartDetailBG,
                            radius: 4,
                            x: 1, y: 4
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                )
                .overlay(
                    colorScheme == .dark ?
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 2)
                    : nil
                )
            Text("인정 시간 \(validAccTime / 3600 )시간 \(validAccTime % 3600 / 60)분")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

