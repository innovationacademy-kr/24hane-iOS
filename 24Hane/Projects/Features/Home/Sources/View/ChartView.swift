//
//  ChartView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import Charts

func getRatio(data: [Double]) -> [Double] {
    var retArray: [Double] = []
    let max: Double = data.max() != 0 ? data.max()! : 1
    for i in 0..<6 {
        let ratio: Double = (data[i] / max)
        retArray.append(ratio)
    }
    return retArray
}

struct ChartView: View {
    @State var selectedChart = 0
    var item: ChartItem
    var ratData: [Double] {
        return getRatio(data: item.data)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
            VStack(alignment: .center) {
                HStack(spacing: 2) {
                    Text("\(item.title)")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .bold))
                    Text("(6\(item.id))")
                        .foregroundColor(.textGray)
                        .font(.system(size: 14, weight: .semibold))
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.leading, 30)
                .padding(.bottom, 10)
                ChartDetailView(selectedChart: $selectedChart, id: item.id, time: item.data[selectedChart], period: item.period[selectedChart])
                    .frame(width: 290, height: 60)
                    .padding(.bottom)
                HStack(alignment: .bottom) {
                    ForEach(0..<ratData.count, id: \.self) { index in
                        Button {
                            selectedChart = index
                        } label: {
                            ZStack(alignment: .bottom) {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 25, height: 87)
                                    .padding(.horizontal, 4)
                                    .foregroundColor(.white)

                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 25, height: 6 + 81 * ratData[index])
                                    .padding(.horizontal, 4)
                                    .foregroundStyle(
                                        LinearGradient(gradient: Gradient(colors: [.gradientBlue, .gradientPurple]), startPoint: .top, endPoint: .bottom)
                                    )
                            }
                        }
                        .buttonStyle(CustomButtonStyle())
                    }
                }
                HStack {
                    Text("최신순")
                    Spacer()
                    Text("오래된순")
                }
                .foregroundColor(Color(hex: "#9B9797"))
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            }
        }

    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(x: configuration.isPressed ? 1.1 : 1, y: configuration.isPressed ? 1.2 : 1, anchor: .bottom)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
