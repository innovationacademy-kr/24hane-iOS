//
//  CoreDataVM.swift
//  HANE24
//
//  Created by Yunki on 2023/02/23.
//

import Foundation
import SwiftUI
import CoreData

class MonthlyLogsController: ObservableObject {
    static let shared: MonthlyLogsController = MonthlyLogsController()
    let container: NSPersistentContainer
    @Published var totalLogs = [MonthlyLogs]()
    
    init() {
        container = NSPersistentContainer(name: "HANE24")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
    }
    
    func fetchLogs() {
        let request = NSFetchRequest<MonthlyLogs>(entityName: "MonthlyLogs")
        do {
            totalLogs = try container.viewContext.fetch(request)
        } catch {
            print("Unresolved error \(error.localizedDescription)")
        }
    }
    
    func addLogs(date: String, inOutLogs: [Logs]) {
        let monthlyLog = MonthlyLogs(context: container.viewContext)
        
        monthlyLog.date = date
        monthlyLog.inOutLogs = inOutLogs
        saveData()
    }
    
    func deleteLogs(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = totalLogs[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
           try container.viewContext.save()
           fetchLogs()
       } catch {
           print("Unresolved error \(error.localizedDescription)")
       }
    }
}
