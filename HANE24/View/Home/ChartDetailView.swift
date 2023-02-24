//
//  ChartDetailView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct ChartDetailView: View {
    @Binding var selectedChart: Int
    var id: String
    var time: Double
    var period: String
    var body: some View {
        ZStack{
            VStack(spacing: -3) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.chartDetailBG)
                    .frame(height: 60)
                HStack{
                    ForEach(0..<6) { idx in
                            Image(systemName: "arrowtriangle.down.fill")
                                .padding(.horizontal, 8)
                                .foregroundColor(.chartDetailBG)
                                .opacity(idx == selectedChart ? 1 : 0)
                        }
                }
                
            }
            VStack{
                HStack{
                    Text(period)
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .semibold))
                    Spacer()
                    Text("총 \(time, specifier: "%.0f")시간")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .semibold))

                }
                .padding(.bottom, 2)
                HStack{
                    Spacer()
                    Text("일 평균")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .semibold))
                    if id == "주" {
                        Text("\(time / 7, specifier: "%.1f")시간")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .semibold))
                    } else {
                        Text("\(time / 7, specifier: "%.1f")시간")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .semibold))
                    }
                }
                .padding(.bottom, 10)
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct ChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDetailView(selectedChart: .constant(3), id: "월", time: 142, period: "1.2(월)-1.8(일)")
    }
}
