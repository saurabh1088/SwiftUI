//
//  OSLogView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/08/24.
//

import SwiftUI

struct OSLogView: ViewModifier {
    @StateObject private var logViewerModel = OSLogViewerModel()
    @State private var showLogs = false
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    toolbarButton
                }
            }
            .sheet(isPresented: $showLogs) {
                OSLogsDisplayView(viewModel: logViewerModel)
                    .presentationDetents([.height(200), .medium])
            }
    }
    
    @ViewBuilder private var toolbarButton: some View {
        Button {
            logViewerModel.extract()
            showLogs = true
        } label: {
            Image("logs", bundle: nil)
                .resizable()
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    NavigationStack {
        Text("Preview Logs Viewer")
            .logsViewer()
    }
}
