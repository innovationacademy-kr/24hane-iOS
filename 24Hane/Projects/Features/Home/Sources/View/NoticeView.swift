//
//  NoticeView.swift
//  24HANE
//
//  Created by Yunki H on 12/12/23.
//

import SwiftUI

public struct NoticeView: View {
    @Binding var showNotice: NoticeType
     var notice: Notice
    
     public var body: some View {
        ZStack {

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)

                VStack(alignment: .center, spacing: 6) {
                    Text(notice.title)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.black)

                    Text(notice.content)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color(hex: "735BF2"))

                    Spacer()

                    Button {
                        showNotice = .none
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(hex: "#EAEAEA"))
                            Text("닫기")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.black)
                        }
                        .frame(height: 45)
                    }
                }
                .padding(.horizontal, 45)
                .padding(.bottom, 30)
                .padding(.top, 50)
            }
            .frame(height: 245)
            .padding(.horizontal, 45)
        }
    }
}
