//
//
// LazyVStackView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 07/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct LazyVStackView: View {
    @State private var regularVStack: Bool = false
    @State private var lazyVStack: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Button {
                regularVStack = true
            } label: {
                Text("Regular VStack")
            }
            .sheet(isPresented: $regularVStack) {
                usingRegularVStack
            }
            
            Button {
                lazyVStack = true
            } label: {
                Text("Lazy VStack")
            }
            .sheet(isPresented: $lazyVStack) {
                usingLazyVStack
            }
        }
    }
    
    @ViewBuilder
    private var usingRegularVStack: some View {
        ScrollView {
            VStack {
                ForEach(1...100, id: \.self) { element in
                    SomeCustomRowView(value: element)
                }
            }
        }
    }
    
    @ViewBuilder
    private var usingLazyVStack: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self) { element in
                    SomeCustomRowView(value: element)
                }
            }
        }
    }
}

struct LazyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackView()
    }
}
