//
//
// UIComponentsView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 03/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

enum Components: String, CaseIterable {
    case bottomSheet = "Bottom Sheets"
    case lazyVStack = "Lazy VStack"
}

struct UIComponentsView: View {
    
    var body: some View {
        VStack {
            List {
                ForEach(Components.allCases, id: \.rawValue) { component in
                    NavigationLink(component.rawValue, value: component)
                }
            }
            .navigationDestination(for: Components.self) { component in
                switch component {
                case .bottomSheet:
                    BottomSheetView()
                case .lazyVStack:
                    BottomSheetView()
                }
            }
        }
    }
}

struct UIComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        UIComponentsView()
    }
}

struct BottomSheetView: View {
    @State private var showBottomSheet: Bool = false
    var body: some View {
        VStack(spacing: 40) {
            Text("Bottom sheet example")
            
            Button {
                showBottomSheet = true
            } label: {
                Text("Open sheet")
            }
            .sheet(isPresented: $showBottomSheet) {
                Text("🤡")
                    .presentationDetents([.medium, .large])
            }
        }
    }
}
