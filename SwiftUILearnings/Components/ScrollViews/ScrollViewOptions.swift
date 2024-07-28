//
//  ScrollViewOptions.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 27/07/24.
//

import SwiftUI

struct ScrollViewOptions: View {
    @EnvironmentObject var appStateObjectModel: AppStateObjectModel
    
    var body: some View {
        List {
            ForEach(ScrollViewScenarios.allCases) { option in
                NavigationLink(option.rawValue, value: option)
            }
        }
        .navigationDestination(for: ScrollViewScenarios.self) { destination in
            switch destination {
            case .simple:
                SimpleScrollView()
            case .readable:
                ReadableScrollView()
            case .pinned:
                PinnedScrollView()
            }
        }
    }
}

#Preview {
    ScrollViewOptions()
}
