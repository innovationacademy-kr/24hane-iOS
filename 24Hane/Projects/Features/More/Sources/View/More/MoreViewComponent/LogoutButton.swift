//
//  LogoutButton.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/14/24.
//

import SwiftUI
import HaneCore

struct LogoutButton: View {
	@Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var auth: Authentication

    var body: some View {
		Button {
            auth.signOut()
		} label: {
			HStack(spacing: 10) {
				Image("logout")
					.resizable()
					.frame(width: 24, height: 24)
					.foregroundColor(.iconColor)
				Text("로그아웃")
					.foregroundColor(Theme.textGrayColor(forScheme: colorScheme))
					.font(.system(size: 16, weight: .semibold))
			}
		}
		.padding(.horizontal, 40)
    }
}
