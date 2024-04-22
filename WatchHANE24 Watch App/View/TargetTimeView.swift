//
//  TargetTimeView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/17/24.
//

import SwiftUI

private struct BackgroundColor: View {
    var body: some View {
        LinearGradient(
            colors: [
                Color.dateBackgroundLevel3,
                Color.dateSelected
            ],
            startPoint: .top,
            endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct TargetTimeStringView: View {
    var accumulationtime: Int64
    var targetTime: Int
    // TODO: UserDefault - DailySelectionOption
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("\(accumulationtime)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("/ \(targetTime)h")
                .font(.footnote)
                .foregroundColor(.fontDisabled)
            Spacer()
        }
    }
}

struct TargetTimeView: View {
    var body: some View {
        ZStack {
            BackgroundColor()

            VStack {
                HStack {
                    Text("일일 목표")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.fontDisabled)
                    Spacer()
                }

                TargetTimeStringView(accumulationtime: 4, targetTime: 12)

                HStack {
                    CircleProgressBar(percent: 30)
                        .scaleEffect(0.8)
                    Spacer()
                }

                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    TargetTimeView()
}
