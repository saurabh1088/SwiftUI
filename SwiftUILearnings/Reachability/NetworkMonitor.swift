//
//  NetworkMonitor.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 17/10/25.
//

import Foundation
import Network

/// A class that monitors the device's network connection status using NWPathMonitor.
/// It conforms to ObservableObject so that SwiftUI views can subscribe to and react
/// to changes in the network status.
final class NetworkMonitor: ObservableObject {

    // MARK: - Published Properties

    /// The current state of the network connection.
    /// This property is marked @Published, causing SwiftUI views to update when it changes.
    @Published private(set) var isConnected: Bool = false

    /// Tracks if the current network connection is considered "expensive" (e.g., cellular data).
    @Published private(set) var isExpensive: Bool = false

    /// The type of network connection being used (e.g., wifi, cellular, wiredEthernet).
    @Published private(set) var connectionType: NWInterface.InterfaceType = .other

    // MARK: - Private Properties

    /// The underlying monitor that watches for network path changes.
    private let monitor = NWPathMonitor()

    /// A private, dedicated queue on which the monitor's updates will be delivered.
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")

    // MARK: - Initialization

    init() {
        // Set the closure that gets called whenever the network path changes.
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            // NWPathMonitor updates happen on the dedicated queue,
            // so we must dispatch updates to the MainActor for @Published properties
            // to correctly update the SwiftUI UI.
            Task { @MainActor in
                self.isConnected = path.status == .satisfied
                self.isExpensive = path.isExpensive
                self.connectionType = self.getConnectionType(for: path)
            }
        }

        // Start monitoring on the dedicated queue.
        monitor.start(queue: queue)
        
        // Initial state check is handled by the first pathUpdateHandler call after start().
    }

    // MARK: - Deinitialization

    /// Stops the network monitor when the object is deallocated.
    deinit {
        monitor.cancel()
    }

    // MARK: - Helper Methods

    /// Determines the active connection interface type from the path.
    private func getConnectionType(for path: NWPath) -> NWInterface.InterfaceType {
        if path.usesInterfaceType(.wifi) {
            return .wifi
        } else if path.usesInterfaceType(.cellular) {
            return .cellular
        } else if path.usesInterfaceType(.wiredEthernet) {
            return .wiredEthernet
        } else if path.usesInterfaceType(.loopback) {
            return .loopback
        } else {
            return .other
        }
    }
}
