//
//  LayoutsExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/10/25.
//

import SwiftUI

struct LayoutsExamplesView: View {
    var body: some View {
        List {
            ForEach(LayoutExample.allCases) { example in
                NavigationLink(example.rawValue, value: example)
            }
        }
        .navigationTitle(Components.layouts.rawValue)
        .navigationDestination(for: LayoutExample.self) { destination in
            switch destination {
            case .anyLayout:
                AnyLayoutView()
            }
        }
    }
}

#Preview {
    LayoutsExamplesView()
}
