//
//  ReissueButton.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

struct ReissueButton: View {
	var cardReissueState: CardState
	@Binding var showAlert: Bool
    var body: some View {
		Button {
			showAlert = true
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor((cardReissueState == .none || cardReissueState == .done) ? .gradientPurple : .textGrayMoreView)
					.frame(height: 45)
				Text("카드 신청하기")
					.font(.system(size: 16, weight: .bold))
					.foregroundColor(.white)
			}
		}
		.disabled((cardReissueState != .none && cardReissueState != .done))
    }
}

struct ReceiveButton: View {
	var cardReissueState: CardState
	@Binding var showAlert: Bool
	var body: some View {
		Button {
			showAlert = true
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor((cardReissueState == .pickUpRequested) ? .gradientPurple : .iconColor)
					.frame(height: 45)
				Text("데스크 카드 수령 완료")
					.font(.system(size: 16, weight: .bold))
					.foregroundColor(.white)
			}
		}
	}
}


struct Preview: PreviewProvider {
	@State static var showAlert: Bool = false
	static var previews: some View {
		VStack {
			Spacer()
			ReissueButton(
				cardReissueState: .inProgress, showAlert: $showAlert
			)
			Spacer()
			ReissueButton(
				cardReissueState: .none, showAlert: $showAlert
			)
			Spacer()
			ReceiveButton(
				cardReissueState: .done, showAlert: $showAlert
			)
			Spacer()
		}
	}
}
