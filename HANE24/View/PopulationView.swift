//
//  PopulationView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/14/23.
//

import SwiftUI

struct PopulationView: View {
    var body: some View {
        ZStack{
            Color.defaultBG
            VStack(alignment: .center){
                HStack{
                    Text("실시간 현황")
                        .fontWeight(.semibold)
                        .padding(.leading, 20)
            
                    Spacer()
                }
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                            .frame(height: 80)
                        HStack{
                            Text("개포")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("\(420)명")
                                .fontWeight(.semibold)
                        }
                        .padding()
                    }
                    .padding(.leading, 15)
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                            .frame(height: 80)
                        HStack{
                            Text("서초")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("\(240)명")
                                .fontWeight(.semibold)
                        }
                        .padding()
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 15)
                }
            }
        }
    }
}

struct PopulationView_Previews: PreviewProvider {
    static var previews: some View {
        PopulationView()
    }
}
