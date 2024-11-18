//
//  GeometryReaderScenarios.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 28/07/24.
//

import SwiftUI

struct GeometryReaderScenarios: View {
    
    var body: some View {
        List {
            ForEach(GeometryReaderExamples.allCases) { example in
                NavigationLink(example.displayName, value: example)
            }
        }
        .navigationTitle(LearningTopics.geometryReader.rawValue)
        .navigationDestination(for: GeometryReaderExamples.self) { destination in
            switch destination {
            case .defaultCoordinates:
                GeometryReaderCoordinatesView()
            case .parentAndChild:
                GeometryReaderParentChildExampleView()
            }
        }
    }
}

#Preview {
    GeometryReaderScenarios()
}
