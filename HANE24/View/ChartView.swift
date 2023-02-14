//
//  ChartView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import Charts

func getRatio(data: Array<Double>) -> Array<Double> {
    var retArray: Array<Double> = []
    let max: Double = data.max()!
    for i in 0..<6 {
        let ratio: Double = (data[i] / max)
        retArray.append(ratio)
    }
    return retArray
}

struct ChartView: View {
    @State var selectedChart = 0
    var item: chartItem
    var ratData: Array<Double> {
        get{
            return getRatio(data: item.data)
        }
    }

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.white)
            VStack(alignment: .center){
                HStack{
                    Text("\(item.title)")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    Text("(6주)")
                        .foregroundColor(.textGray)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.bottom, 10)
                ChartDetailView(id: item.id, time: item.data[selectedChart], period: item.period[selectedChart])
                    .frame(width: 300, height: 70)
                    .padding(.bottom, -20)
                HStack(alignment: .bottom){
                    ForEach(0..<ratData.count, id: \.self){index in
                        Button{
                            selectedChart = index
                        } label: {
                            ZStack(alignment: .bottom){
                                if selectedChart == index {
                                    Rectangle()
                                        .frame(width: 3, height: 125)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 10)
                                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.6)))
                                }
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width:28, height: 100 * ratData[index])
                                    .padding(4)
                                    .foregroundStyle(
                                        LinearGradient(gradient: Gradient(colors: [.gradientBlue, .gradientPurple]), startPoint: .top, endPoint: .bottom)
                                    )
                            }
                                
                        }
                    }
                }
                .padding()
            }
        }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(item: chartItem(id: "주", title: "최근 주간 그래프", period: ["1.2(월)-1.8(일)","1.9(월)-1.15(일)","1.16(월)-1.22(일)","1.23(월)-1.29(일)","1.30(월)-2.5(일)"], data:  [42, 20, 41, 33, 59, 50]))
    }
}
