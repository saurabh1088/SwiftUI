//
//  NWInterface+Extension.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 18/10/25.
//

import Foundation
import Network

extension NWInterface.InterfaceType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .wifi: return "Wi-Fi"
        case .cellular: return "Cellular"
        case .wiredEthernet: return "Ethernet"
        case .loopback: return "Loopback"
        case .other: return "Other"
        @unknown default: return "Unknown"
        }
    }
}
