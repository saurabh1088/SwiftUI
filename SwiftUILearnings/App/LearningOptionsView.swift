//
//  LearningOptionsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 04/05/24.
//

import SwiftUI

struct LearningOptionsView: View {
    @EnvironmentObject var appStateData: AppStateObjectModel
    
    var body: some View {
        if #available(iOS 17.0, *) {
            navigationUsingNewNavigationStackAPI
        } else {
            navigationUsingDeprecatedNavigationViewAPI
        }
    }
}

#Preview {
    LearningOptionsView()
}

extension LearningOptionsView {
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
                Section {
                    ForEach(LearningTopics.allCases, id: \.rawValue) { item in
                        NavigationLink(item.rawValue, value: item)
                    }
                }
            }
            .navigationDestination(for: LearningTopics.self) { topic in
                learningDestinationViewFor(topic: topic)
            }
            .navigationTitle("Learnings")
        }
    }
}

extension LearningOptionsView {
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

extension LearningOptionsView {
    @ViewBuilder
    private func learningDestinationViewFor(topic: LearningTopics) -> some View {
        switch topic {
        case .animations:
            AnimationExamplesView()
        case .augmentedReality:
            AugmentedRealityView()
        case .apis:
            TheCatAPIView()
        case .charts:
            ChartsView()
        case .dataEssentials:
            DataEssentialView()
        case .debug:
            DebugView(viewModel: DebugViewModel())
        case .eventsKit:
            EventKitView()
        case .geometryReader:
            BasicGeometryReaderView()
        case .notifications:
            NotificationsView()
        case .pdfFiles:
            PDFDocumentView()
        case .speech:
            SpeechView()
        case .testPitch:
            TestPitchView()
        case .uiComponents:
            UIComponentsView()
        case .uiGestures:
            GesturesView()
        case .webContentTechnologies:
            BasicWebContentTechnologiesView()
        case .widgetExtension:
            WidgetUIView()
        }
    }
}
