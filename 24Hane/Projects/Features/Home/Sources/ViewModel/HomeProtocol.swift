//
//  HomeProtocol.swift
//  Home
//
//  Created by Katherine JANG on 8/8/24.
//

import Foundation

protocol HomeDataProtocol {
    var mainInfo: MainInfo { get set }
    var isLoading: Bool { get set }
    
    func getWeeklyPeriod() -> [String]
    func getMonthlyPeriod() -> [String]
    func getInfoMessage() -> Notice
}

protocol HomeFetchProtocol {
    func updateMainInfo() async
    func updateAccumulationTimes() async
    func refresh() async
}

protocol HomeProtocol
: ObservableObject, HomeDataProtocol, HomeFetchProtocol
{}

