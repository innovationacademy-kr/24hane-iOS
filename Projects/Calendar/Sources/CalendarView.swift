//
//  CalendarView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/15.
//

import SwiftUI
import Utils

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

/// selectedDate: Date = 선택 날짜
struct CalendarView: View {
    @Environment(\.colorScheme) var colorScheme
//    @EnvironmentObject var hane: Hane
	@EnvironmentObject var calendarVM: CalendarVM

    var body: some View {
        ZStack {
            Theme.calendarBackgroundColor(forScheme: colorScheme)
                .edgesIgnoringSafeArea(colorScheme == .dark ? .all : .top)
            ScrollView {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                    Task {
						try await calendarVM.updateMonthlyLogs(date: calendarVM.calendarModel.selectedDate)
                    }
                }
                VStack(spacing: 16) {
                    CalendarBodyView(datePickerSelection: calendarVM.calendarModel.selectedDate)
                        .padding(.horizontal, 5)
                    AccTimeCardForCalendarView(
						totalAccTime: calendarVM.calendarModel.monthlyTotalAccumulationTime,
						validAccTime: calendarVM.calendarModel.monthlyAcceptedAccumulationTime)
                    .padding(.vertical, 10)
					TagLogView(logList: calendarVM.convertedSelectedMonthlyLog)
                    .padding(.top, 10)
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
            .coordinateSpace(name: "pullToRefresh")
        }
        .coordinateSpace(name: "pullToRefresh")
        .onChange(of: calendarVM.calendarModel.selectedDate) {[oldDate = calendarVM.calendarModel.selectedDate]  newDate in
            if oldDate.monthToInt != newDate.monthToInt || oldDate.yearToInt != newDate.yearToInt {
                Task {
                    try await calendarVM.updateMonthlyLogs(date: newDate)
                }
            }
        }
    }
}

#Preview {
    CalendarView()
		.environmentObject(CalendarVM())
}
