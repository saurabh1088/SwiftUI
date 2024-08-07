//
//  DebugView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/05/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct DebugView: View {
    @ObservedObject var viewModel: DebugViewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.createDebugModel()
                viewModel.createSomeDebuggable()
                viewModel.createSomeDebugModelWithNoCustomStringConvertible()
            } label: {
                Text("LLDB - po")
            }
            .buttonStyle(.fullScreenWide)
            
            Button {
                viewModel.crashInBackgroundThread()
            } label: {
                Text("Crash")
            }
            .buttonStyle(.fullScreenWide)
            
            Button {
                viewModel.createMemoryLeak()
            } label: {
                Text("Memory Leaks")
            }
            .buttonStyle(.fullScreenWide)
        }
    }
}

#Preview {
    DebugView(viewModel: DebugViewModel())
}
