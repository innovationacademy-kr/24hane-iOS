//
//  ChartView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import Charts

let data: Array<Double> = [142, 100, 121, 123, 139, 130]

func getRatio(data: Array<Double>) -> Array<Double> {
    var retArray: Array<Double> = []
    let max: Double = data.max()!
    for i in 0..<6 {
        let ratio: Double = (data[i] / max)
        retArray.append(ratio)
    }
    return retArray
}

var ratData: Array<Double> {
    get{
        return getRatio(data: data)
    }
}


struct ChartView: View {
    @State var selectedChart = 0

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.white)
            VStack(alignment: .center){
                HStack{
                    Text("최근 주간 그래프")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    Text("(6주)")
                        .foregroundColor(.textGray)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.leading, 55)
                ChartDetailView(time: data[selectedChart])
                    .frame(width: 280, height: 70)
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
        ChartView()
    }
}
