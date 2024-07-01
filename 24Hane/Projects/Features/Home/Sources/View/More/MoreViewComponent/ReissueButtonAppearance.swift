//
//  MoreViewReissue.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/14/24.
//

import SwiftUI

struct ReissueButtonAppearance: View {
	@Environment(\.colorScheme) var colorScheme

    var body: some View {
		HStack(spacing: 10) {
			Image("card")
				.resizable()
				.frame(width: 24, height: 24)
				.foregroundColor(.iconColor)
			Text("카드 재발급 신청")
				.foregroundColor(Theme.textGrayColor(forScheme: colorScheme))
				.font(.system(size: 16, weight: .semibold))
		}
    }
}

#Preview {
    ReissueButtonAppearance()
}
