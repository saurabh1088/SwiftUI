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
    @State private var showWKWebView: Bool = false
    var body: some View {
        VStack {
            // SFSafariViewController example
            // Button to open an in-app browser which underneath uses SFSafariViewController
            Button {
                showSafariWebView = true
            } label: {
                Text("Safari In-App Browser")
            }
            .sheet(isPresented: $showSafariWebView) {
                SafariWebView(url: URL(string: "https://github.com/saurabh1088")!)
            }
            
            // WKWebView examples
            // Button to open an in-app browser which underneath uses WKWebView
            // Here one can notice that the webview is without any navigation elements
            // unlikely to the SFSafariViewController. So if navigation is desired then
            // that needs to be implemented.
            Button {
                showWKWebView = true
            } label: {
                Text("WKWebView In-App Browser")
            }
            .sheet(isPresented: $showWKWebView) {
                SwiftUIWKWebView(url: URL(string: "https://github.com/saurabh1088")!)
            }
            
            // WKWebView is here presented via a NavigationLink. Using this approach
            // the webview is pushed on navigation stack similar to any other view
            // and also the default back navigation button is also provided. This
            // approach can be take if one wants to show the webview but still wants
            // the navigation bar (top navigation and/or bottom navigation) elements intact.
            NavigationLink {
                SwiftUIWKWebView(url: URL(string: "https://github.com/saurabh1088")!)
            } label: {
                Text("WKWebView via Navigation Link")
            }
            
            // Same as example above, only the webview is a part of a view
            // hierarchy made up of other SwiftUI views. This example shows how
            // webview using WKWebView can be seamlessly integrated with other
            // views in the app's view hierarchy.
            NavigationLink {
                VStack {
                    Text("Some Text")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                    Spacer()
                    SwiftUIWKWebView(url: URL(string: "https://github.com/saurabh1088")!)
                    Spacer()
                    Text("Some Text")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                }
                
            } label: {
                Text("WKWebView embedded with other views")
            }

        }
    }
}

struct OpenURLsInAppBrowserExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        OpenURLsInAppBrowserExamplesView()
    }
}
