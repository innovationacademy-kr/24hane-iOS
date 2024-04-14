//
//  AlertView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/28/23.
//

import SwiftUI

struct AlertView: View {
    @Binding var showAlert: Bool
    @EnvironmentObject var hane: Hane
	@EnvironmentObject var reissue: ReissueVM

    var item: AlertItem

    var body: some View {
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
                    submitButton
                } else {
                    receiveButton
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

    var submitButton: some View {
        Button {
            Task {
                do {
					try await reissue.requestReissue()
					reissue.cardReissueState = .apply
                }
            }
            showAlert = false
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gradientPurple)
                    .frame(width: 250, height: 50)
                Text("네, 신청하겠습니다")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }

    var receiveButton: some View {
        Button {
            Task {
                do {
					try await reissue.finishReissue()
					reissue.cardReissueState = .done
                } catch {
					reissue.cardReissueState = .pickUpRequested
                }
            }
            showAlert = false
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gradientPurple)
                    .frame(width: 250, height: 50)
                Text("네, 확인했습니다")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    AlertView(showAlert: .constant(true), item: AlertItem(id: "신청", title1: "카드 재발급을", title2: "신청하시겠습니까?", statement: "신청 후 취소가 불가능합니다.", buttonTitle: "네, 신청하겠습니다"))
        .environmentObject(Hane())
		.environmentObject(ReissueVM())
}
