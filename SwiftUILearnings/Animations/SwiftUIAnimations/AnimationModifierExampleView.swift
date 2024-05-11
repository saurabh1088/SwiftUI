//
//  AnimationModifierExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 11/05/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct AnimationModifierExampleView: View {
    @State private var animate = false
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    var body: some View {
        VStack {
            animatingView
        }
        .sheet(isPresented: .constant(true), content: {
            animationSelectorSheet
                .presentationDetents([.height(100), .medium])
        })
    }
    
    @ViewBuilder
    private var animatingView: some View {
        VStack {
            Text("🚴")
                .font(.system(size: 40))
                .offset(x: animate ? 0 : screenWidth)
                .animation(.default, value: animate)
            
            Text("🚴")
                .font(.system(size: 40))
                .offset(x: animate ? 0 : screenWidth)
                .animation(.easeIn, value: animate)
            
            Text("🚴")
                .font(.system(size: 40))
                .offset(x: animate ? 0 : screenWidth)
                .animation(.easeOut, value: animate)
            
            Text("🚴")
                .font(.system(size: 40))
                .offset(x: animate ? 0 : screenWidth)
                .animation(.easeInOut, value: animate)
            
            Text("🚴")
                .font(.system(size: 40))
                .offset(x: animate ? 0 : screenWidth)
                .animation(.interactiveSpring, value: animate)
        }
    }
    
    @ViewBuilder
    private var animationSelectorSheet: some View {
        VStack {
            Button {
                animate.toggle()
            } label: {
                Text("Animate")
            }
            .buttonStyle(.fullScreenWide)
        }
    }
}

#Preview {
    AnimationModifierExampleView()
}
