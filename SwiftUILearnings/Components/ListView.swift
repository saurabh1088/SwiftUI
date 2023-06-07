//
//
// ListView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 30/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        
// TODO: https://swiftwithmajid.com/2021/06/16/mastering-list-in-swiftui/

import SwiftUI

struct ListView: View {
    @State private var multiplier: Int = 1
    @State private var listViewType: ListViewTypes = .simple
    @State private var selectedListViewIndex: Int = 0
    @State private var listSelectedIndexes = Set<UUID>()
    
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
            case .multipleSelection:
                listViewMultipleSelection
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
    
    @ViewBuilder
    private var listViewMultipleSelection: some View {
        VStack {
            List(listItems, selection: $listSelectedIndexes) { row in
                Text("\(row.selectedIndex)")
            }
            Text("Selections :: \(listSelectedIndexes.count)")
        }
        .navigationTitle("Items")
        .toolbar { EditButton() }
        
    }
    
    private var listItems = [SelectableListModel(selectedIndex: 1),
                             SelectableListModel(selectedIndex: 2),
                             SelectableListModel(selectedIndex: 3),
                             SelectableListModel(selectedIndex: 4),
                             SelectableListModel(selectedIndex: 5),
                             SelectableListModel(selectedIndex: 6),
                             SelectableListModel(selectedIndex: 7),
                             SelectableListModel(selectedIndex: 8),
                             SelectableListModel(selectedIndex: 9)]
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
