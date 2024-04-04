//
//  HeaderView.swift
//  24HANE
//
//  Created by Katherine JANG on 3/26/24.
//

import SwiftUI

struct HeaderView: View {
	@Environment(\.colorScheme) var colorScheme
	@EnvironmentObject var hane: Hane
	
    var body: some View {
		VStack(alignment: .center, spacing: 20) {
			HStack(alignment: .center) {
				if hane.profileImage != "" {
					AsyncImage(url: URL(string: hane.profileImage)) { image in
						image
							.resizable()
							.scaledToFill()
							.frame(width: 28, height: 28)
							.clipShape(Circle())
							.padding(.trailing, 3)
					} placeholder: {
						Image(systemName: "person.circle")
							.resizable()
							.frame(width: 28, height: 28)
							.padding(.trailing, 3)
							.foregroundColor(.iconColor)
					}
				} else {
					Image(systemName: "person.circle")
						.resizable()
						.frame(width: 28, height: 28)
						.padding(.trailing, 3)
						.foregroundColor(.iconColor)
				}
				
				Text(hane.loginID)
					.font(.system(size: 20, weight: .semibold, design: .rounded))
					.foregroundColor(!hane.isInCluster && colorScheme == .light ? .black : .white)
				
				if hane.isInCluster {
					Circle()
						.foregroundColor(.green)
						.frame(width: 8, height: 8)
						.padding(.bottom, 10)
						.padding(.leading, 0)
				}
				
				Spacer()
			}
			.padding(.top, 20)
			.frame(height: 30)
			.padding(.horizontal, 30)
		}

    }
}

#Preview {
    HeaderView()
}
