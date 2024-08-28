//
//  ListItemButton.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/14/24.
//

import SwiftUI
import HaneCore

struct ListItemButton: View {
	@Environment(\.openURL) private var openURL
	@Environment(\.colorScheme) var colorScheme
	let item: MoreItem

    var body: some View {
		HStack(spacing: 10) {
			Image(item.image)
				.resizable()
				.frame(width: 24.0, height: 24.0)
				.foregroundColor(.iconColor)
				.imageScale(.large)
			Button {
				if let url = URL(string: item.url) {
					openURL(url)
				}
			} label: {
				Text(item.title)
					.foregroundColor(Theme.textGrayColor(forScheme: colorScheme))
					.font(.system(size: 16, weight: .semibold))
			}
		}
		.padding(.horizontal, 40)
    }
}
