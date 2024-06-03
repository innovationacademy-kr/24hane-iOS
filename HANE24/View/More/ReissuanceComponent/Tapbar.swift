//
//  TapbarBackButton.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

struct Tapbar: View {
	@Environment(\.presentationMode) var presentationMode
	@Environment(\.colorScheme) var colorScheme

    var body: some View {
		HStack {
			Button(action: {
				presentationMode.wrappedValue.dismiss()
			}, label: {
				Image(systemName: "chevron.left")
					.foregroundColor(Theme.toolBarIconColor(forScheme: colorScheme))
					.imageScale(.large)
					.padding()
			})
			Spacer()
			Text("카드 재발급 신청")
				.font(.system(size: 20, weight: .bold))
			Spacer()
			Image(systemName: "chevron.left")
				.foregroundColor(Theme.toolBarIconColor(forScheme: colorScheme))
				.imageScale(.large)
				.padding()
				.isHidden(true)
		}
		.padding(.bottom, 15)
    }
}

#Preview {
    Tapbar()
}
