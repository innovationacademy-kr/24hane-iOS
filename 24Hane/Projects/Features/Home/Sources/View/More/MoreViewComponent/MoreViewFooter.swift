//
//  MoreViewFooter.swift
//  HANE24Test
//
//  Created by Hosung Lim on 4/14/24.
//

import SwiftUI

struct MoreViewFooter: View {
    var body: some View {
		VStack(alignment: .center) {
			Divider()
				.padding(.top, -10)
			Text("🅒 2023. 24HANE. all rights reserved.")
				.font(.system(size: 10, weight: .regular))
				.foregroundColor(Color(hex: "9B9797"))
		}
		.padding(.horizontal, 40)
    }
}

#Preview {
    MoreViewFooter()
}
