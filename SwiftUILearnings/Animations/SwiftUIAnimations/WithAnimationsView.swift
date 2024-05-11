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
            
            Text("🤡")
                .font(.system(size: animate ? 200 : 2))
            
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
