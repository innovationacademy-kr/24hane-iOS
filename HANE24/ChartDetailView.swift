//
//  ChartDetailView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct ChartDetailView: View {
    var time: Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.chartDetailBG)
            VStack{
                HStack{
                    Text("2.12(월)-2.18(일)")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("총 \(time, specifier: "%.0f")시간")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                .padding(1)
                HStack{
                    Spacer()
                    Text("일 평균 \(time / 7, specifier: "%.1f")시간")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
    }
}

struct ChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDetailView(time: 142)
    }
}
