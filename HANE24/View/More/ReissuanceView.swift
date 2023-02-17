//
//  ReissuanceView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/15/23.
//

import SwiftUI

struct progressItem: Identifiable{
    var id: UUID
    var title: String
    var statement: String
    
}




struct ReissuanceView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.LightDefaultBG.ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            VStack(){
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .imageScale(.large)
                            .padding()
                    })
                    Text("카드 재발급 신청")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading, 70)
                        .padding(.trailing, 120)
                }
                .padding(.bottom, 15)
                VStack(spacing: 15){
                    HStack{
                        Text("재발급 신청 방법")
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                    }
                    Button {} label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.chartDetailBG)
                                .frame(height: 45)
                            Text("자세히보기")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 20)
                    HStack{
                        Text("재발급 신청 현황")
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                    }
                    /// ProgressView 따로 빼기...
                    CardProgress
                    Spacer()
                    Button {} label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gradientPurple)
                                .frame(height: 45)
                            Text("카드 신청하기")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
    
    var CardProgress: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(height: 300)
            VStack(alignment: .leading){
                HStack(spacing: 15){
                    ZStack{
                        Circle()
                        //    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                            .foregroundColor(.gradientPurple)
                            .frame(width: 50, height: 50)
                        Text("신청")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(hex: "EAEAEA"))
                    }
                    VStack(alignment: .leading, spacing: 5){
                        Text("신청 후 업체에 입금해주세요.")
                            .font(.system(size: 16, weight: .bold))
                        Text("업체에서 입금 확인 후 제작이 진행됩니다.")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
                .padding()
                Image(systemName: "chevron.down")
                    .foregroundColor(Color(hex: "D9D9D9"))
                    .padding(.horizontal, 30)
                HStack(spacing: 15){
                    ZStack{
                        Text("제작")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.iconColor)
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                            .foregroundColor(Color(hex: "EAEAEA"))
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading, spacing: 5){
                        Text("제작 기간은 약 2주간 소요됩니다.")
                            .font(.system(size: 16, weight: .bold))
                        Text("출입카드 재발급 신청 후 업체에서 입금 확인 후 제작이 진행됩니다.")
                            .font(.system(size: 14, weight: .regular))
                    }
                        
                }
                .padding()
                Image(systemName: "chevron.down")
                    .foregroundColor(Color(hex: "D9D9D9"))
                    .padding(.horizontal, 30)
                HStack(spacing: 15){
                    ZStack{
                        Text("완료")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.iconColor)
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                            .foregroundColor(Color(hex: "EAEAEA"))
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading, spacing: 5){
                        Text("카드를 수령해주세요.")
                            .font(.system(size: 16, weight: .bold))
                        Text("재발급 카드는 데스크에서 수령가능합니다.")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
                .padding()
                
            }
            
        }
    }
}

struct ReissuanceView_Previews: PreviewProvider {
    static var previews: some View {
        ReissuanceView()
    }
}
