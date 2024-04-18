//
//  AccumulationView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 4/16/24.
//

import SwiftUI

struct StandardTimeView: View {
	var standardTime: Int64
	var body: some View {
		HStack {
			Text("24HANE")
				.foregroundColor(Color.dateSelected)

			Text("12:24 11:01 기준")
				.font(.caption)
				.foregroundColor(.fontGray)
		}
	}
}

struct MonthlyAccumulationView: View {
	var monthlyAccumulation: Int64
	var body: some View {
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
	}
}

struct AcceptedAccumulationTimeView: View {
	var acceptedAccumulation: Int64
	var body: some View {
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
	}
}

struct AccumulationView: View {
    var body: some View {
		ZStack {
			Color.white
				.ignoresSafeArea()
			VStack(alignment: .leading) {
				StandardTimeView(standardTime: 123456)

				Spacer()

				MonthlyAccumulationView(monthlyAccumulation: 12345)

				Spacer()

				AcceptedAccumulationTimeView(acceptedAccumulation: 123455)

				Spacer()
			}
		}
    }
}

#Preview {
    AccumulationView()
}
