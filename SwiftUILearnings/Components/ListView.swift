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
    
    var body: some View {
        refreshableListView
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
    private var refreshableListView: some View {
        List(1..<100) { row in
            Text("List item \(row * multiplier)")
        }
        .refreshable {
            print("Refresh action")
            multiplier = multiplier * 2
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
