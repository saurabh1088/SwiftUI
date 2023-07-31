//
//  ComponentScrollView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 31/07/23.
//

import SwiftUI

struct ComponentScrollView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            scrollViewIOS17Vertical
        } else {
            scrollViewPreIOS17
        }
        
    }
    
    @available(iOS 17.0, *)
    @ViewBuilder
    private var scrollViewIOS17Horizontal: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(width: 300, height: 100)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .safeAreaPadding(.horizontal, 40)
    }
    
    @available(iOS 17.0, *)
    @ViewBuilder
    private var scrollViewIOS17Vertical: some View {
        ScrollView {
            ForEach(0..<50) { i in
                Text("Item \(i)")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .frame(height: 800)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 20))
            }
        }
        .scrollTargetBehavior(.paging)
    }
    
    @ViewBuilder
    private var scrollViewPreIOS17: some View {
        ScrollView {
            LazyHStack {
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(width: 300, height: 100)
                }
            }
        }
    }
}

#Preview {
    ComponentScrollView()
}
