//
//  ReachabilityTestingView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 17/10/25.
//

import SwiftUI

struct ReachabilityTestingView: View {
    var body: some View {
        NetworkStatusView()
            .environmentObject(NetworkMonitor())
    }
}

#Preview {
    ReachabilityTestingView()
}
