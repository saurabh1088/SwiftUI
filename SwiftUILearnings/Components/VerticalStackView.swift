//
//
// VerticalStackView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 08/06/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct VerticalStackView: View {
    var body: some View {
        vStackWithLeadingAlignment
    }
    
    @ViewBuilder
    private var simpleVStackView: some View {
        VStack {
            Text("🚗")
            Text("🛺")
        }
        .frame(width: 70, height: 70)
        .background(Color.yellow)
    }
    
    @ViewBuilder
    private var vStackWithCenterAlignment: some View {
        VStack(alignment: .center) {
            Text("🚗")
            Text("🛺🛺")
        }
        .frame(width: 70, height: 70)
        .background(Color.yellow)
    }
    
    @ViewBuilder
    private var vStackWithLeadingAlignment: some View {
        VStack(alignment: .leading) {
            Text("🚗🚗")
            Text("🛺")
        }
        .frame(width: 70, height: 70)
        .background(Color.yellow)
    }
    
    
}

struct VerticalStackView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalStackView()
    }
}
