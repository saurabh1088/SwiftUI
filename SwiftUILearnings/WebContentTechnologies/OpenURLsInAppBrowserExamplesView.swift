//
//
// OpenURLsInAppBrowserExamplesView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 04/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct OpenURLsInAppBrowserExamplesView: View {
    @State private var showSafariWebView: Bool = false
    var body: some View {
        VStack {
            Button {
                showSafariWebView = true
            } label: {
                Text("Safari In-App Browser")
            }
            .sheet(isPresented: $showSafariWebView) {
                SafariWebView(url: URL(string: "https://github.com/saurabh1088")!)
            }
        }
    }
}

struct OpenURLsInAppBrowserExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        OpenURLsInAppBrowserExamplesView()
    }
}
