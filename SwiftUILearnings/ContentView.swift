//
//  ContentView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/03/23.
//  Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

import SwiftUI

enum LearningTopics: String, CaseIterable {
    case geometryReader = "Geometry Reader"
    case webContentTechnologies = "Web Content Technologies"
}

struct ContentView: View {
    
    @State private var learningPaths: [LearningTopics] = []
    
    var body: some View {
        navigationUsingNewNavigationStackAPI
    }
    
    /// `NavigationStack` is new API from SwiftUI framework replacing the older `NavigationView` one.
    /// This is available from iOS 16 onwards. Here in this example a NavigationStack is set up.
    @ViewBuilder
    private var navigationUsingNewNavigationStackAPI: some View {
        NavigationStack(path: $learningPaths) {
            List {
                ForEach(LearningTopics.allCases, id: \.rawValue) { item in
                    NavigationLink(item.rawValue, value: item)
                }
            }
            .navigationDestination(for: LearningTopics.self) { topic in
                switch topic {
                case .geometryReader:
                    BasicGeometryReaderView()
                case .webContentTechnologies:
                    BasicWebContentTechnologiesView()
                }
            }
        }
    }
    
    @ViewBuilder
    private var navigationUsingDeprecatedNavigationViewAPI: some View {
        NavigationView {
            // Here if these NavigationLink's aren't put inside VStack and are
            // directly inside NavigationView then only one will show up.
            VStack {
                NavigationLink("Geometry Reader", destination: BasicGeometryReaderView())
                NavigationLink("Web Content Technologies", destination: BasicWebContentTechnologiesView())
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
