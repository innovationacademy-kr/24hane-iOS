//
//  Structs.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import Foundation
/// For Views
/// TagLogView
struct Log: Hashable {
    var inTime: String?
    var outTime: String?
    var logTime: String?
}

/// ChartView
struct ChartItem: Identifiable {
    var id: String
    var title: String
    var period: [String]
    var data: [Double]
}

/// MoreView
struct MoreItem: Identifiable {
    var id: UUID
    var title: String
    var url: String
    var image: String
}

/// HomeView Modal
struct Notice {
    var title: String
    var content: String
}
