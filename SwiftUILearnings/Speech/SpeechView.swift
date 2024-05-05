//
//  SpeechView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 05/10/23.
//

import SwiftUI
import Speech
import SwiftUIViewsHelper

/// Steps
///
/// 1. Add key `NSMicrophoneUsageDescription` to Info plist.
/// 2. Add key `NSSpeechRecognitionUsageDescription` to Info plist.
struct SpeechView: View {
    @StateObject var speechViewModel = SpeechViewModel()
    @State private var isListening = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text(speechViewModel.transcript)
                .font(.system(size: 40))
                .padding()
            
            Button {
                if isListening {
                    speechViewModel.stopTranscribing()
                } else {
                    speechViewModel.transcribe()
                }
                isListening.toggle()
            } label: {
                Text(isListening ? "Stop" : "Say")
            }
            .buttonStyle(.fullScreenWide)
            .background(isListening ? Color.red : Color.blue)
        }
        .onDisappear {
            speechViewModel.stopTranscribing()
        }
    }
}

#Preview {
    SpeechView()
}
