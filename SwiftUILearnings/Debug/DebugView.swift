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
                viewModel.createSomeDebugable()
            } label: {
                Text("LLDB - po")
            }
            .buttonStyle(.fullScreenWide)
        }
    }
}

#Preview {
    DebugView(viewModel: DebugViewModel())
}
