//
//  WithAnimationsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 11/05/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct WithAnimationsView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            animationsView
            Spacer()
        }
        .sheet(isPresented: .constant(true)) {
            animationSelectorSheet
                .presentationDetents([.height(100), .medium])
        }
    }
    
    @ViewBuilder
    private var animationsView: some View {
        VStack {
            Text("🤡")
                .font(.system(size: animate ? 200 : 2))
        }
    }
    
    @ViewBuilder
    private var animationSelectorSheet: some View {
        VStack {
            Button {
                withAnimation {
                    animate.toggle()
                }
            } label: {
                Text("Animate")
            }
            .buttonStyle(.fullScreenWide)
        }
    }
}

#Preview {
    WithAnimationsView()
}
