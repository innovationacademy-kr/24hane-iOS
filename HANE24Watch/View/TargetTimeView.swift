//
//  TargetTimeView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/17/24.
//

import SwiftUI

struct TargetTimeView: View {
    var body: some View {
		ZStack {
			LinearGradient(
				colors: [
					Color.dateBackgroundLevel3,
					Color.dateSelected
				],
				startPoint: .top,
				endPoint: .bottom)
				.ignoresSafeArea()

			VStack {
				HStack {
					Text("일일 목표")
						.font(.title3)
						.fontWeight(.bold)
						.foregroundColor(.fontDisabled)
					Spacer()
				}

				HStack {
					Text("6.2")
						.font(.largeTitle)
						.fontWeight(.bold)
					Text("/ 12h")
						.font(.footnote)
						.foregroundColor(.fontDisabled)
					Spacer()
				}
				HStack {
					CircleProgressBar(percent: 50)
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
