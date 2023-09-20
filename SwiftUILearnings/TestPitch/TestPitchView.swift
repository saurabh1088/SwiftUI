//
//  TestPitchView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 20/09/23.
//

import SwiftUI

struct TestPitchView: View {
    @State private var animationWithDispatchTest = false
    @State private var offset = 0.0
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "smiley")
                .resizable()
                .frame(width: 20, height: 20)
                .offset(x: 0.0, y: offset)
            
            Button {
                animationWithDispatchTest.toggle()
            } label: {
                Text("Play")
            }
        }
        .onChange(of: animationWithDispatchTest) { newValue in
            DispatchQueue.main.async {
                withAnimation {
                    offset = newValue ? 300.0 : 0.0
                }
            }
        }
    }
}

#Preview {
    TestPitchView()
}
