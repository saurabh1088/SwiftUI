//
//
// HorizontalStackView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 07/06/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct HorizontalStackView: View {
    var body: some View {
        hStackWithCenterAlignment
    }
    
    @ViewBuilder
    private var simpleHStackView: some View {
        HStack {
            Text("🚗")
            Text("🛺")
        }
    }
    
    @ViewBuilder
    private var hStackWithBottomAlignment: some View {
        HStack(alignment: .bottom) {
            VStack {
                Text("🌊")
                Text("🌊")
                Text("🌊")
            }
            Text("🚤")
        }
    }
    
    @ViewBuilder
    private var hStackWithTopAlignment: some View {
        HStack(alignment: .top) {
            VStack {
                Text("🌊")
                Text("🌊")
                Text("🌊")
            }
            Text("🚤")
        }
    }
    
    @ViewBuilder
    private var hStackWithCenterAlignment: some View {
        HStack(alignment: .center) {
            VStack {
                Text("🌊")
                Text("🌊")
                Text("🌊")
            }
            Text("🚤")
        }
    }
}

struct HorizontalStackView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStackView()
    }
}
