//
//  ChartDetailView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct ChartDetailView: View {
    var id: String
    var time: Double
    var period: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.chartDetailBG)
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
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct ChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDetailView(id: "월", time: 142, period: "1.2(월)-1.8(일)")
    }
}
