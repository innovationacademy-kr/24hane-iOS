//
//  CircularProgressBar.swift
//  24HANE
//
//  Created by Katherine JANG on 3/27/24.
//

import SwiftUI

struct CircularProgressBar: View {
    
    @AppStorage("DailySelectionOption") private var dailySelectionOption =  UserDefaults.standard.integer(forKey: "DailySelectionOption")
    
    @Binding var drawingStroke: Bool
    @Binding var percentage: Int
    
    var body: some View {
		ZStack {
			HStack(spacing: 0) {
				Text("\(percentage)")
					.font(.system(size: 32, weight: .medium, design: .default))
					.foregroundColor(.black)
				Text("%")
					.font(.system(size: 14, weight: .medium, design: .default))
					.foregroundColor(.black)
					.padding(.top, 10)
			}
			Circle()
				.stroke(
					AngularGradient(
						gradient: Gradient(
							colors: [
								.gradientBlue,
								.gradientWhtie,
								.gradientPurple,
								.gradientPurple,
								.gradientWhtie,
								.gradientBlue
							]
						),
						center: .center,
						startAngle: .zero,
						endAngle: .degrees(360)
					).opacity(0.1),
					style: StrokeStyle(lineWidth: 8, lineCap: .round)
				)
				.overlay {
					Circle()
                        .trim(from: 0, to: drawingStroke ? CGFloat(percentage)/100 : 0)
						.stroke(
							AngularGradient(
								gradient: Gradient(colors: [
									.gradientBlue.opacity(0.35),
									.gradientWhtie,
									.gradientPurple,
									.gradientPurple,
									.gradientWhtie,
									.gradientBlue.opacity(0.35)
								]),
								center: .center,
								startAngle: .degrees(0),
								endAngle: .degrees(360)
							),
							style: StrokeStyle(lineWidth: 8, lineCap: .round))
						.rotationEffect(.degrees(270))
				}
		}

    }
}

