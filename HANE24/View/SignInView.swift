//
//  SignInView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/21/23.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.gradientPurple, .gradientBlue]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            VStack(alignment: .center){
                ZStack(alignment: .bottomLeading){
                    Rectangle()
                        .fill( LinearGradient(gradient: Gradient(colors: [.gradientPurple, .gradientBlue]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .frame(width: 150, height: 150)
                    VStack(alignment: .leading){
                        Text("24")
                            .font(.system(size: 35, weight: .semibold))
                        Text("HANE")
                            .font(.system(size: 35, weight: .heavy))
                    }
                    .padding(10)
                    .foregroundColor(.white)
                }
                .padding(.bottom, 70)
                Text("입실과 퇴실의 짝이 일치하는 경우에만 출입 누적시간이 반영됩니다.")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .regular))
                Text("입/퇴실 시 출입카드를 꼭 태깅해주세요.")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.white)
                Button{} label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.DarkDefaultBG)
                        Text("LOG IN")
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 45)
                .padding(10)
            }
            .padding(.horizontal, 10)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
