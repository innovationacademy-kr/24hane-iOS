//
//  ProgressToReissue.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

struct ProgressToReissue: View {
	var cardReissueState: CardState
    var body: some View {
		HStack {
			Text("재발급 신청 현황")
				.font(.system(size: 20, weight: .bold))
			Spacer()
		}
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.foregroundColor(.white)
				.frame(height: 300)
			VStack(alignment: .leading) {
				CardProgressView(item: ProgressItem(
					id: "신청",
					title: "신청 후 업체에 입금해주세요",
					statement: "업체에서 입금 확인 후 제작이 진행됩니다.",
					isProcessing: (cardReissueState == .apply)
				))
				Image(systemName: "chevron.down")
					.foregroundColor(Color(hex: "D9D9D9"))
					.padding(.horizontal, 30)
				CardProgressView(item: ProgressItem(
					id: "제작",
					title: "제작 기간은 약 2주간 소요됩니다",
					statement: "출입카드 재발급 신청 후 업체에서 입금 확인 후 제작이 진행됩니다.",
					isProcessing: (cardReissueState == .inProgress)
				))
				Image(systemName: "chevron.down")
					.foregroundColor(Color(hex: "D9D9D9"))
					.padding(.horizontal, 30)
				CardProgressView(item: ProgressItem(
					id: "완료",
					title: "카드를 수령해주세요",
					statement: "재발급 카드는 데스크에서 수령 가능합니다",
					isProcessing: (cardReissueState == .pickUpRequested)
				))
			}
		}
    }
}

#Preview {
	ProgressToReissue(cardReissueState: .inProgress)
}
