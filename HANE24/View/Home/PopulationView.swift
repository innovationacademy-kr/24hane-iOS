//
//  PopulationView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/14/23.
//

import SwiftUI

struct PopulationView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            HStack{
                Text("  실시간 현황")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
            }
            HStack(spacing: 25){
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 155, height: 80)
                    HStack{
                        Text("개포")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.trailing, 20)
                            .foregroundColor(.black)
                        Text("\(420)명")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 20)
                            .foregroundColor(.black)
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 155, height: 80)
                    HStack{
                        Text("서초")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.trailing, 20)
                            .foregroundColor(.black)
                        Text("\(240)명")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 20)
                            .foregroundColor(.black)
                    }
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
