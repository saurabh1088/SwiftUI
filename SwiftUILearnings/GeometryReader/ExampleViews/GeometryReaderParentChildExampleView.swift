//
//  GeometryReaderParentChildExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 28/07/24.
//

import SwiftUI

/// Here in this example we have a parent and child view hierarchy. What is shown here is that when `GeometryReader`
/// is used then the 
struct GeometryReaderParentChildExampleView: View {
    
    var body: some View {
        VStack {
            parentView
        }
    }
    
    @ViewBuilder private var parentView: some View {
        VStack {
            childView
        }
        .frame(width: 300, height: 300)
        .background(Color.red)
    }
    
    @ViewBuilder private var childView: some View {
        GeometryReader { proxy in
            ZStack {
                Color.blue
            }
            .frame(width: proxy.size.width/2, height: proxy.size.height/2)
        }
    }
}

#Preview {
    GeometryReaderParentChildExampleView()
}
