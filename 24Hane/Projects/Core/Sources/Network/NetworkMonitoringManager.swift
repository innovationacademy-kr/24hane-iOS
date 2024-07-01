//
//  NetworkManager.swift
//  HANE24
//
//  Created by Katherine JANG on 2/27/23.
//

import Foundation
import Network

public class NetworkMonitoringManager: ObservableObject {
    public let monitor = NWPathMonitor()
    public let queue = DispatchQueue(label: "NetworkMonitor")

    @Published public var isConnected = true
    @Published public var showAlert = false

    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected =  path.status == .satisfied
                self.showAlert = !self.isConnected
            }
        }
        monitor.start(queue: queue)
    }

    public func monitoringNetwork(completionHandler: @escaping(Bool) -> Void) {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected =  path.status == .satisfied
                self.showAlert = !self.isConnected
                completionHandler(self.isConnected)
            }
        }
        monitor.start(queue: queue)
    }
}
