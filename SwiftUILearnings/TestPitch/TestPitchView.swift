//
//  TestPitchView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 20/09/23.
//

import SwiftUI

class UserDefaultsProvider {
    static let defaults = UserDefaults(suiteName: "group.com.saurabh.SwiftUILearnings")!
}

struct TestPitchView: View {
    @State private var animationWithDispatchTest = false
    @State private var offset = 0.0
    @State private var showSampleTestPitchView = false
    
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
            
            Button {
                showSampleTestPitchView.toggle()
            } label: {
                Text("Sample Pitch Fullscreen")
            }
            
            Button {
                UserDefaultsProvider.defaults.set("Happy", forKey: "mood")
            } label: {
                Text("Happy")
            }
            
            Button {
                UserDefaultsProvider.defaults.set("Sad", forKey: "mood")
            } label: {
                Text("Sad")
            }

        }
        .onChange(of: animationWithDispatchTest) { newValue in
            DispatchQueue.main.async {
                withAnimation {
                    offset = newValue ? 300.0 : 0.0
                }
            }
        }
        .fullScreenCover(isPresented: $showSampleTestPitchView) {
            SampleTestPitchView(animate: $animationWithDispatchTest)
        }
    }
}

#Preview {
    TestPitchView()
}

struct SampleTestPitchView: View {
    @Binding var animate: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "smiley")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("Sample Test Pitch View")
                .font(.system(size: 20))
            
            Button {
                animate.toggle()
            } label: {
                Text("Animate")
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Dismiss")
            }
        }
    }
}
