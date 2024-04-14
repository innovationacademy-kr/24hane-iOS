//
//  MoreView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/15/23.
//

import SwiftUI
import WebKit

// More 페이지의 내부 페이지들
var listItems: [MoreItem] = [
    MoreItem(id: UUID(), title: "지원금 지침 안내", url: "https://\(Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")/redirect/money_guidelines", image: "book"),
    MoreItem(id: UUID(), title: "출입기록 문의", url: "https://\(Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")/redirect/question", image: "chat"),
    MoreItem(id: UUID(), title: "이용가이드", url: "https://\(Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")/redirect/usage", image: "info"),
    MoreItem(id: UUID(), title: "앱 피드백", url: "https://\(Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")/redirect/feedback", image: "user"),
    MoreItem(id: UUID(), title: "이용약관", url: "https://\(Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")/redirect/terms", image: "union")
]

struct MoreView: View {
    @Environment(\.openURL) private var openURL
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var hane: Hane
	@StateObject var reissue: ReissueVM = ReissueVM()

    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Theme.backgroundColor(forScheme: colorScheme)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 30) {
                    Text("더보기")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top)
                        .padding(.leading, 30)

                    NavigationLink(destination: ReissuanceView()) {
                        ReissueButtonAppearance()
                    }
                    .padding(.horizontal, 40)
                    .navigationBarHidden(true)
                    .simultaneousGesture(TapGesture().onEnded {
                        Task {
							try await reissue.updateReissueState()
                        }
                    })

                    ForEach(listItems) { item in
						ListItemButton(item: item)
                    }

                    LogoutButton()

                    MoreViewFooter()
                }
            }
        }

    }
}

#Preview {
    MoreView()
        .environmentObject(Hane())
}
