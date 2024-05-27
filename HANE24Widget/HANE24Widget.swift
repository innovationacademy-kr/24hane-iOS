//
//  HANE24Widget.swift
//  HANE24Widget
//
//  Created by Katherine JANG on 12/13/23.
//

import WidgetKit
import Foundation
import SwiftUI

struct Provider: TimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),
                    accTimes: MonthlyAccumulationTimes(totalAccumulationTime: 153720,
                                                       acceptedAccumulationTime: 153720), isTokenValid: true)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) { getMonthlyAccTime { (result, times) in
        let entry = SimpleEntry(date: Date(),
                                accTimes: MonthlyAccumulationTimes(totalAccumulationTime: times.totalAccumulationTime,
                                                                   acceptedAccumulationTime: times.acceptedAccumulationTime), isTokenValid: result)
        completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) { getMonthlyAccTime { (result, times) in
        let currentDate = Date()
        let entry = SimpleEntry(date: Date(),
                                accTimes: MonthlyAccumulationTimes(totalAccumulationTime: times.totalAccumulationTime,
                                                                   acceptedAccumulationTime: times.acceptedAccumulationTime), isTokenValid: result)
        let nextRefresh = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(nextRefresh))
        completion(timeline)
        }
    }

    private func getMonthlyAccTime(completion: @escaping((Bool, MonthlyAccumulationTimes) -> Void)) {
        let APIroot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
        var components = URLComponents(string: APIroot + "/v3/tag-log/getAllTagPerMonth")!
        let year = URLQueryItem(name: "year", value: "\(Date.now.yearToInt)")
        let month = URLQueryItem(name: "month", value: "\(Date.now.monthToInt)")
        components.queryItems = [year, month]
        guard let token = getAccessToken() else {
            completion(false, MonthlyAccumulationTimes(totalAccumulationTime: 0, acceptedAccumulationTime: 0))
            return
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(String(describing: token))"
        ]
        URLSession.shared.dataTask(with: request) {data, _, _ in
            guard let data = data,
                  let accTimes = try? JSONDecoder().decode(MonthlyAccumulationTimes.self, from: data) else {
                completion(false, MonthlyAccumulationTimes(totalAccumulationTime: 0, acceptedAccumulationTime: 0))
                return
            }
            completion(true, accTimes)
        }.resume()
    }

    private func getAccessToken() -> String? {
        return UserDefaults.shared.string(forKey: HaneWidgetConstant.storageKey)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let accTimes: MonthlyAccumulationTimes
    let isTokenValid: Bool
}

struct HANE24WidgetEntryView: View {
    @Environment(\.colorScheme) var colorScheme
    var entry: Provider.Entry

    var body: some View {
        if entry.isTokenValid {
            showAccTimes
        } else {
            tokenExpired
        }
    }

    var showAccTimes: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 7) {
                Text("24HANE")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(colorScheme == .dark ? Color(hex: "#FFFFFF") : Color(hex: "#735BF2"))
                Text("\(entry.date.MM).\(entry.date.dd) \(entry.date.hourToString):\(entry.date.minuteToString) 기준")
                    .font(.system(size: 9))
                    .foregroundStyle(colorScheme == .dark ? Color(hex: "#EAEAEA") : Color(hex: "#707070"))
                    .allowsTightening(true)
            }

            HStack {
                Rectangle()
                    .frame(width: 2, height: 32)
                    .foregroundStyle(colorScheme == .dark ? Color(hex: "#FFFFFF") : Color(hex: "#333333"))
                VStack(alignment: .leading) {
                    Text("월 누적 시간")
                        .font(.system(size: 15, weight: .semibold))
                    Text("\(entry.accTimes.totalAccumulationTime / 3600) 시간 \(entry.accTimes.totalAccumulationTime % 3600 / 60) 분")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(colorScheme == .dark ? Color(hex: "#EAEAEA") : Color(hex: "#707070"))
                }
            }
            .padding(.top, 18)

            HStack {
                Rectangle()
                    .frame(width: 2, height: 32)
                    .foregroundStyle(colorScheme == .dark ? Color(hex: "#FFFFFF") : Color(hex: "#735BF2"))
                VStack(alignment: .leading) {
                    Text("인정 시간")
                        .font(.system(size: 15, weight: .semibold))
                    Text("\(entry.accTimes.acceptedAccumulationTime / 3600) 시간 \(entry.accTimes.acceptedAccumulationTime % 3600 / 60) 분")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(colorScheme == .dark ? Color(hex: "#EAEAEA") : Color(hex: "#707070"))
                }
            }
            .padding(.top, 12)
        }
    }

    var tokenExpired: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("인증 유효시간 초과")
                .font(.system(size: 15, weight: .semibold))
            Text("앱에서 다시 로그인을 진행해주세요")
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(colorScheme == .dark ? Color(hex: "#EAEAEA") : Color(hex: "#707070"))
        }
    }
}

struct HANE24Widget: Widget {
    let kind: String = HaneWidgetConstant.widgetKind

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            HANE24WidgetEntryView(entry: entry)
                .containerBackground(Color("WidgetBackground"), for: .widget)
        }
        .configurationDisplayName("24HANE Widget")
        .description("총 체류시간 & 인정시간 제공")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    HANE24Widget()
} timeline: {
    SimpleEntry(date: .now, accTimes: MonthlyAccumulationTimes(totalAccumulationTime: 123456, acceptedAccumulationTime: 12345), isTokenValid: true)
    SimpleEntry(date: .now, accTimes: MonthlyAccumulationTimes(totalAccumulationTime: 123456, acceptedAccumulationTime: 12345), isTokenValid: true)
}
