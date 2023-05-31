//
//
// ListView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 30/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct ListView: View {
    @State private var multiplier: Int = 1
    @State private var listViewType: ListViewTypes = .simple
    @State private var selectedListViewIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 8) {
            switch listViewType {
            case .simple:
                listView
            case .refreshable:
                listViewRefreshable
            case .grouped:
                listViewGroupedStyle
            case .inset:
                listViewInsetStyle
            case .insetGrouped:
                listViewInsetGroupedStyle
            case .plain:
                listViewPlainStyle
            case .sidebar:
                listViewSideBarStyle
            }
            
            Text("List style : \(listViewType.rawValue)")
            
            Button {
                selectedListViewIndex = (selectedListViewIndex + 1) % ListViewTypes.allCases.count
                listViewType = ListViewTypes.allCases[selectedListViewIndex]
            } label: {
                Text("Next")
            }

        }
        .animation(.easeInOut(duration: 0.5), value: listViewType)
    }
    
    @ViewBuilder
    private var listView: some View {
        List(1..<10) { row in
            Text("List item \(row)")
        }
    }
    
    @ViewBuilder
    private var listViewRefreshable: some View {
        List(1..<10) { row in
            Text("List item \(row * multiplier)")
        }
        .refreshable {
            print("Refresh action")
            multiplier = multiplier * 2
        }
    }
    
    @ViewBuilder
    private var listViewGroupedStyle: some View {
        List(1..<10) { row in
            Text("List item \(row)")
        }
        .listStyle(.grouped)
    }
    
    @ViewBuilder
    private var listViewInsetStyle: some View {
        List(1..<10) { row in
            Text("List item \(row)")
        }
        .listStyle(.inset)
    }
    
    @ViewBuilder
    private var listViewInsetGroupedStyle: some View {
        List(1..<10) { row in
            Text("List item \(row)")
        }
        .listStyle(.insetGrouped)
    }
    
    @ViewBuilder
    private var listViewPlainStyle: some View {
        List(1..<10) { row in
            Text("List item \(row)")
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private var listViewSideBarStyle: some View {
        List(1..<10) { row in
            Text("List item \(row)")
        }
        .listStyle(.sidebar)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
