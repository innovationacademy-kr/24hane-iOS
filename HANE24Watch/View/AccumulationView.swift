//
//  AccumulationView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct AccumulationView: View {
    var body: some View {
		ZStack {
			Color.white
				.ignoresSafeArea()
			VStack(alignment: .leading) {
				HStack {
					Text("24HANE")
						.foregroundColor(Color.dateSelected)

					Text("12:24 11:01 기준")
						.font(.caption)
						.foregroundColor(.fontGray)
				}

				Spacer()

				HStack {
					Rectangle()
						.foregroundColor(.black)
						.frame(width: 3, height: 40)

					VStack(alignment: .leading) {
						Text("월 누적 시간")
							.foregroundColor(.fontDefault)
							.font(.title3)
							.fontWeight(.heavy)

						Text("112시간 42분")
							.foregroundColor(.fontGray)
					}
				}

				Spacer()

				HStack {
					Rectangle()
						.foregroundColor(.dateSelected)
						.frame(width: 3, height: 40)

					VStack(alignment: .leading) {
						Text("인정 시간")
							.foregroundColor(.fontDefault)
							.font(.title3)
							.fontWeight(.heavy)

						Text("112시간 42분")
							.foregroundColor(.fontGray)
					}
				}

				Spacer()
			}
		}
    }
}

#Preview {
    AccumulationView()
}
