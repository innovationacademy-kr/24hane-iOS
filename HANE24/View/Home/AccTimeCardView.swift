//
//  AccTimeCardView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/14.
//

import SwiftUI

/// accTime: Int64 - 시간 (초 / sec)
/// viewColor: Color - 뷰 내부 색상
struct AccTimeCardView: View {
    @EnvironmentObject var hane: Hane
    
    @AppStorage("DailySelectionOption") private var dailySelectionOption =  UserDefaults.standard.integer(forKey: "DailySelectionOption")

    @State var isFold: Bool = true
    @State var drawingStroke = false

    let options: [Double] = (4...24).map { Double($0) }

    let animation = Animation.easeOut(duration: 0.8).delay(0.1)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)

            VStack(spacing: 5) {
                Button {
                    withAnimation {
                        isFold.toggle()
                        drawingStroke = false
                    }
                } label: {
                    HStack(spacing: 2) {
                        Image(systemName: "exclamationmark.circle")
                            .font(.system(size: 16))
                            .foregroundStyle(Color(hex: "#9B9797"))
                        Text("이용 시간")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                        ZStack {
                            if hane.loading {
                                LoadingAnimation()
                                    .padding(.trailing, 10)
                            } else {
                                HStack(alignment: .bottom, spacing: 0) {
                                    Text("\(hane.dailyAccumulationTime / 3600)")
                                        .font(.system(size: 20, weight: .semibold))
                                    Text("시간 ")
                                    Text("\(hane.dailyAccumulationTime % 3600 / 60)")
                                        .font(.system(size: 20, weight: .semibold))
                                    Text("분")
                                }
                            }
                        }

                        Image(systemName: "chevron.right")
                            .rotationEffect(isFold ? Angle(degrees: 0) : Angle(degrees: 90))
                            .isHidden(hane.loading)
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                }

                if !isFold {
                    VStack {
                        HStack {
                            Text("목표 시간")
                                .font(.system(size: 16, weight: .bold))

                            Spacer()

                            Menu {
                                Picker(selection: $dailySelectionOption) {
                                    ForEach(0..<options.count, id: \.self) { times in
                                        Text("\(Int(options[times])) 시간")
                                    }
                                } label: {}.onChange(of: dailySelectionOption) { selection in
                                    UserDefaults.standard.setValue(selection, forKey: "DailySelectionOption")
                                }
                            } label: {
                                Text("\(Int(options[dailySelectionOption]))")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("시간")
                                Image(systemName: "chevron.down")
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.gray)
                                    .hidden()
                            }

                        }
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal)

                        progressCircle
                            .frame(width: 120, height: 120)
                            .padding(.bottom, 10)
                            .animation(animation, value: drawingStroke)
                            .onAppear {
                                drawingStroke = true
                            }
                    }
                }
            }
            .padding()
        }
        .frame(maxHeight: isFold ? 80 : 260, alignment: .top)
    }

    var progressCircle: some View {

        ZStack {
            HStack(spacing: 0) {
                Text("\(Int(Double(hane.dailyAccumulationTime) / Double(options[dailySelectionOption] * 3600) * 100))")
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
                                .gradientBlue.opacity(0.1),
                                .gradientWhtie.opacity(0.1),
                                .gradientPurple.opacity(0.1),
                                .gradientPurple.opacity(0.1),
                                .gradientWhtie.opacity(0.1),
                                .gradientBlue.opacity(0.1)
                            ]
                        ),
                        center: .center,
                        startAngle: .zero,
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .overlay {
                    Circle()
                        .trim(from: 0, to: drawingStroke ? (Double(hane.dailyAccumulationTime) / Double(options[dailySelectionOption] * 3600)) : 0)
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

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

#Preview {
    var hane = Hane()
    hane.dailyAccumulationTime = 12280
    hane.loading = false
    return AccTimeCardView()
        .environmentObject(hane)
}
