//
//  HowToReissue.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

struct HowToReissue: View {
	@Environment(\.openURL) private var openURL
	@Environment(\.colorScheme) var colorScheme
    var body: some View {
		HStack {
			Text("재발급 신청 방법")
				.font(.system(size: 20, weight: .bold))
			Spacer()
		}
		Button {
			if let url = URL(string: "https://\(Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")/redirect/reissuance_guidelines") {
				openURL(url)
			}
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(colorScheme == .dark ? .white : .chartDetailBG)
					.frame(height: 45)
				Text("자세히보기")
					.font(.system(size: 16, weight: .bold))
					.foregroundColor(colorScheme == .dark ? .chartDetailBG : .LightDefaultBG)
			}
		}
		.padding(.bottom, 20)
    }
}

#Preview {
    HowToReissue()
}
