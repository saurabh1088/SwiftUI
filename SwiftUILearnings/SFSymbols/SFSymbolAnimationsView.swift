//
//  SFSymbolAnimationsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 24/06/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct SFSymbolAnimationsView: View {
    @State private var bounce = false
    
    var body: some View {
        VStack {
            Image(systemName: "message.badge.filled.fill")
                .font(.system(size: 100))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.bounce, value: bounce)
            
            Button {
                bounce.toggle()
            } label: {
                Text("Bounce")
            }

        }
        .navigationTitle(SFSymbolScenarios.animation.rawValue)
    }
}

@available(iOS 17.0, *)
#Preview {
    SFSymbolAnimationsView()
}
