//
//  GeometryReaderParentChildExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 28/07/24.
//

import SwiftUI

/// Here in this example we have a parent and child view hierarchy. What is shown here is that when `GeometryReader`
/// is used for the child view, the child will get to know the geometry of it's parent through `GeometryProxy`
/// passed in the closure of `GeometryReader`. This proxy can be used to read the geometry of parent view
/// and used further.
/// Here in this example, the child view uses the geometry to make itself half of the size of the parent.
struct GeometryReaderParentChildExampleView: View {
    @State private var dimension: CGFloat = 300
    
    var body: some View {
        VStack {
            parentView
            
            HStack {
                updateDimension(value: 100)
                updateDimension(value: 200)
                updateDimension(value: 300)
            }
        }
    }
    
    @ViewBuilder private var parentView: some View {
        VStack {
            childView
        }
        .frame(width: dimension, height: dimension)
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
    
    @ViewBuilder private func updateDimension(value: CGFloat) -> some View {
        Button {
            withAnimation {
                dimension = value
            }
        } label: {
            Text("\(value)")
                .background(Color.red)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    GeometryReaderParentChildExampleView()
}
