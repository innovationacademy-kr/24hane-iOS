//
//  CircleProgressBar.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/17/24.
//

import SwiftUI

struct BackgroundCircle: View {
	var body: some View {
		Circle()
			.stroke(
				Color.white.opacity(0.2),
				style: StrokeStyle(
					lineWidth: 15,
					lineCap: .round
				)
			)
	}
}

struct InProgressCircle: View {
	var drawingStroke: Bool
	var percent: Int
	var body: some View {
		Circle()
			.trim(from: 0, to: drawingStroke ? (CGFloat(percent) / 100) : 0)
			.stroke(
				Color.white,
				style: StrokeStyle(
					lineWidth: 15,
					lineCap: .round
				)
			)
			.rotationEffect(Angle(degrees: -90))
			.shadow(radius: 28)
	}
}

struct CircleProgressBar: View {
	@State private var drawingStroke = false

	let animation = Animation
			.easeOut(duration: 3)
			.delay(0.5)

	@State var percent: Int

    var body: some View {
		ZStack {
			BackgroundCircle()

			InProgressCircle(drawingStroke: drawingStroke, percent: percent)

			Image(systemName: "medal")
				.resizable()
				.scaledToFit()
				.frame(width: 30)
				.opacity(0.6)
		}
		.animation(animation, value: drawingStroke)
		.onAppear {
			drawingStroke.toggle()
		}
    }
}

#Preview {
    CircleProgressBar(percent: 42)
}
