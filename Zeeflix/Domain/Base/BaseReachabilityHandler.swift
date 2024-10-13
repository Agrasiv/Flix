//
//  BaseReachabilityHandler.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import Reachability

class BaseReachabilityHandler: NSObject {
    // Observable property to keep track of network status
    @objc dynamic var networkStatus = 0

    private let reachability = try! Reachability()

    override init() {
        super.init()
        startMonitoringReachability()
    }

    deinit {
        stopMonitoringReachability()
    }

    private func startMonitoringReachability() {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        try? reachability.startNotifier()
    }

    private func stopMonitoringReachability() {
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
        reachability.stopNotifier()
    }

    @objc private func reachabilityChanged(note: Notification) {
        guard let reachability = note.object as? Reachability else { return }

        switch reachability.connection {
        case .wifi:
            networkStatus = 1
        case .cellular:
            networkStatus = 2
        case .unavailable:
            networkStatus = 3
        }
    }
}
