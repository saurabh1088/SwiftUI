//
//  ContentView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/03/23.
//  Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var appStateData = AppStateObjectModel()
    
    var body: some View {
        LearningOptionsView()
            .environmentObject(appStateData)
            .onAppear(perform: setupNotifications)
    }
}

extension ContentView {
    private func setupNotifications() {
        NotificationsSetupManager().setupNotifications()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// TODO: Private Click Measurement
// https://webkit.org/blog/11529/introducing-private-click-measurement-pcm/

// TODO: Result Builder
// https://www.avanderlee.com/swift/result-builders/
// https://www.swiftbysundell.com/articles/deep-dive-into-swift-function-builders/
