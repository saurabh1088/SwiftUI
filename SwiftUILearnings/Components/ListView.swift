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
    
    var body: some View {
        VStack {
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
            }
        }
    }
    
    @ViewBuilder
    private var listView: some View {
        List {
            Text("List item one")
            Text("List item two")
            Text("List item three")
        }
    }
    
    @ViewBuilder
    private var listViewRefreshable: some View {
        List(1..<100) { row in
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
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
