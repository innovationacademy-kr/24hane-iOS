//
//  AlertView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/28/23.
//

import SwiftUI

public struct AlertView: View {
    @Binding var showAlert: Bool
	@ObservedObject var reissue: ReissueVM

    var item: AlertItem

    public var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.7))
            .opacity(0.5)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: 300, height: 300)
            VStack {
                Text(item.title1)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Text(item.title2)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Text(item.statement)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gradientPurple)
                    .padding()
                if item.id == "신청" {
                    AlertSubmitButton(reissue: reissue, showAlert: $showAlert)
                } else {
                    AlertReceiveButton(reissue: reissue, showAlert: $showAlert)
                }
                Button {
                    showAlert = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.LightDefaultBG)
                            .frame(width: 250, height: 50)
                        Text("취소")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                    }
                }

            }
        }
        .background(Color.gray.opacity(0.7))
    }
}
