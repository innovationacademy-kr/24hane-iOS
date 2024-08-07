//
//  PullToRefresh.swift
//  24HANE
//
//  Created by Katherine JANG on 3/26/24.
//

import SwiftUI

struct PullToRefresh: View {
	var coordinateSpaceName: String
	var onRefresh: () -> Void

	@State var needRefresh: Bool = false

	var body: some View {
		GeometryReader { geo in
			if (geo.frame(in: .named(coordinateSpaceName))).midY > 50 {
				Spacer()
					.onAppear {
						needRefresh = true
					}
			} else if geo.frame(in: .named(coordinateSpaceName)).midY < 10 {
				Spacer()
					.onAppear {
						if needRefresh {
							needRefresh = false
							onRefresh()
						}
					}
			}
			HStack {
				Spacer()
				if needRefresh {
					ProgressView()
				}
				Spacer()
			}
		} .padding(.top, -50)
	}
}
