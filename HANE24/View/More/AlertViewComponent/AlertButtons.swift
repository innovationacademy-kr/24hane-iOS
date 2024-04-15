//
//  Buttons.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

//struct AlertSubmitButton: View {
//	@EnvironmentObject var reissue: ReissueVM
//	@Binding var showAlert: Bool
//    var body: some View {
//		Button {
//			Task {
//				do {
//					try await reissue.requestReissue()
//					reissue.cardReissueState = .apply
//				}
//			}
//			showAlert = false
//		} label: {
//			ZStack {
//				RoundedRectangle(cornerRadius: 10)
//					.foregroundColor(.gradientPurple)
//					.frame(width: 250, height: 50)
//				Text("네, 신청하겠습니다")
//					.font(.system(size: 16, weight: .bold))
//					.foregroundColor(.white)
//			}
//		}
//    }
//}
//
//struct AlertReceiveButton: View {
//	@EnvironmentObject var reissue: ReissueVM
//	@Binding var showAlert: Bool
//	var body: some View {
//		Button {
//			Task {
//				do {
//					try await reissue.finishReissue()
//					reissue.cardReissueState = .done
//				} catch {
//					reissue.cardReissueState = .pickUpRequested
//				}
//			}
//			showAlert = false
//		} label: {
//			ZStack {
//				RoundedRectangle(cornerRadius: 10)
//					.foregroundColor(.gradientPurple)
//					.frame(width: 250, height: 50)
//				Text("네, 확인했습니다")
//					.font(.system(size: 16, weight: .bold))
//					.foregroundColor(.white)
//			}
//		}
//	}
//}
//
//struct AlertPreview: PreviewProvider {
//	@State static var showAlert: Bool = false
//	static var previews: some View {
//		VStack {
//			AlertSubmitButton(showAlert: $showAlert)
//				.environmentObject(ReissueVM())
//			AlertReceiveButton(showAlert: $showAlert)
//				.environmentObject(ReissueVM())
//		}
//	}
//}
