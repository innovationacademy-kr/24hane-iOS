//
//  CircleProgressBar.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/17/24.
//

import SwiftUI

struct CircleProgressBar: View {

	@State var percent: Int

    var body: some View {
		ZStack {
			Circle()
				.stroke(
					Color.white.opacity(0.2),
					style: StrokeStyle(
						lineWidth: 15,
						lineCap: .round
					)
				)

			Circle()
				.trim(from: (1 - (CGFloat(percent) / 100)), to: 1)
				.stroke(
					Color.white,
					style: StrokeStyle(
						lineWidth: 15,
						lineCap: .round
					)
				)
				.rotationEffect(Angle(degrees: 90))
				.rotation3DEffect(
					Angle(degrees: 180),
					axis: (x: 1.0, y: 0.0, z: 0.0)
				)
				.shadow(radius: 28)

			Image(systemName: "medal")
				.resizable()
				.scaledToFit()
				.frame(width: 30)
		}
    }
}

#Preview {
    CircleProgressBar(percent: 42)
}
