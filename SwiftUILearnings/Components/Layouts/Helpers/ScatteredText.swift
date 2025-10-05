//
//  ScatteredText.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 05/10/25.
//

import SwiftUI

struct ScatteredText: View {
    @State private var animate = false

    var body: some View {
        VStack {
            Text("❄️")
                .scaleEffect(animate ? 1.2 : 1.0)
                .opacity(animate ? 1.0 : 0.5)
                .animation(
                    Animation.easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: true),
                    value: animate
                )
        }
        .onAppear {
            // Start the animation after a random delay
            let randomDelay = Double(Int.random(in: 0...5))
            DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
                animate = true
            }
        }
    }
}


#Preview {
    ScatteredText()
}

