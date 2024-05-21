//
//  AnimationExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 10/05/24.
//

import SwiftUI

struct AnimationExamplesView: View {
    var body: some View {
        VStack {
            List {
                ForEach(AnimationScenarios.allCases, id: \.rawValue) { scenario in
                    NavigationLink(scenario.rawValue, value: scenario)
                }
            }
            .navigationTitle(Text("Scenarios"))
            .navigationDestination(for: AnimationScenarios.self) { scenario in
                switch scenario {
                case .swiftUI:
                    SwiftUIAnimationsView()
                case .lottie:
                    LottieAnimationsView()
                }
            }
        }
    }
}

#Preview {
    AnimationExamplesView()
}
