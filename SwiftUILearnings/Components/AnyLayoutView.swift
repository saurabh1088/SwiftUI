//
//
// AnyLayoutView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 11/06/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

/**
 `AnyLayout`
 `AnyLayout` is available in SwiftUI framework from iOS 16 onwards. It provides a type-erased instance of the
 layout protocol.
 Using `AnyLayout` one can dynamically change the type of layout container without destroying the state of
 subviews.
 */
struct AnyLayoutView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @State private var switchLayout: Bool = false
    
    var body: some View {
        anyLayoutRespondingToStateChange
    }
    
    @ViewBuilder
    private var anyLayoutRespondingToDynamicTypeSize: some View {
        let layout = dynamicTypeSize <= .medium ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        layout {
            Text("🏀")
            Text("🏏")
        }
    }
    
    @ViewBuilder
    private var anyLayoutRespondingToStateChange: some View {
        VStack {
            let layout = switchLayout ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
            layout {
                Text("🏀")
                Text("🏏")
            }
            Button {
                switchLayout.toggle()
            } label: {
                Text("Switch Layout")
            }

        }
        .animation(.easeInOut, value: switchLayout)
    }
}

struct AnyLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        AnyLayoutView()
    }
}
