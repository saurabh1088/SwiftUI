//
//  SwiftUIAnimationsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 10/05/24.
//

import SwiftUI

struct SwiftUIAnimationsView: View {
    var body: some View {
        VStack {
            List {
                ForEach(SwiftUIAnimationScenarios.allCases, id: \.rawValue) { scenario in
                    NavigationLink(scenario.rawValue, value: scenario)
                }
            }
            .navigationDestination(for: SwiftUIAnimationScenarios.self) { destination in
                switch destination {
                case .withAnimation:
                    WithAnimationsView()
                }
            }
        }
    }
}

#Preview {
    SwiftUIAnimationsView()
}
