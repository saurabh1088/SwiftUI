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
    case dataEssentials = "Data Essentials"
    case notifications = "Notifications"
    case pdfFiles = "PDF Files"
    case uiComponents = "UI Components"
}

struct ContentView: View {
    
    @StateObject private var appStateData = AppStateObjectModel()
    
    var body: some View {
        navigationUsingNewNavigationStackAPI
            .environmentObject(appStateData)
            .onAppear {
                NotificationsManager.shared.requestPermission()
            }
    }
    
    /// `NavigationStack` is new API from SwiftUI framework replacing the older `NavigationView` one.
    /// This is available from iOS 16 onwards. Here in this example a NavigationStack is set up. `navigationPath`
    /// binding property given to `NavigationStack` will be stacked with topics as in when view is pushed.
    /// Coming back to root view will make this property back to empty.
    /// `NavigationStack` used here wraps a `List` so `List` here becomes root view. Using `NavigationStack`
    /// further within hierarchy will cause issues.
    ///
    /// `NavigationStack` doesn't mandate to provide a binding to collection, so it's perfectly fine to do
    /// something like below :
    /// ```
    ///     NavigationStack {
    ///         List {
    ///             ForEach(LearningTopics.allCases, id: \.rawValue) { item in
    ///                 NavigationLink(item.rawValue, value: item)
    ///             }
    ///         }
    ///     }
    ///
    /// ```
    /// In this case by default `NavigationStack` will manage the state to keep track of views on stack.
    /// We give binding to a collection so as to share control of the navigation view stack state.
    /// This binding to a collection can be of any type, one can create an enum with all possible values of hierarchy
    /// one expects in application. Or one can use `NavigationPath` (refer `AppStateObjectModel`)
    @ViewBuilder
    private var navigationUsingNewNavigationStackAPI: some View {
        // navigationPath list is maintained as a stack of views in navigation.
        // To pop to root view make this empty, refer DataEssentialTertiaryLevelView
        NavigationStack(path: $appStateData.navigationPath) {
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
                case .dataEssentials:
                    DataEssentialView()
                case .notifications:
                    NotificationsView()
                case .pdfFiles:
                    PDFDocumentView()
                case .uiComponents:
                    UIComponentsView()
                }
            }
            .navigationTitle("Learnings")
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

//TODO: Private Click Measurement
// https://webkit.org/blog/11529/introducing-private-click-measurement-pcm/

//TODO: Result Builder
// https://www.avanderlee.com/swift/result-builders/
// https://www.swiftbysundell.com/articles/deep-dive-into-swift-function-builders/
