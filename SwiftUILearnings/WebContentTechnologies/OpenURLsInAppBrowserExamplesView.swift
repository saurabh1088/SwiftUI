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
    
    // State properties
    @State private var showSafariWebView: Bool = false
    @State private var showWKWebView: Bool = false
    
    // Computed properties
    private var localHtmlContentUrl: URL {
        return Bundle.main.url(forResource: "index", withExtension: "html")!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                sfSafariWebViewLink
                wkWebViewLink
                wkWebViewInNavigationLink
                embeddedWkWebview
                wkWebViewLoadingLocalHTML
            }
        }
    }
    
    // SFSafariViewController example
    // Button to open an in-app browser which underneath uses SFSafariViewController
    private var sfSafariWebViewLink: some View {
        Button {
            showSafariWebView = true
        } label: {
            Text("Safari In-App Browser")
        }
        .sheet(isPresented: $showSafariWebView) {
            SafariWebView(url: URL(string: "https://github.com/saurabh1088")!)
        }
    }
    
    // WKWebView examples
    // Button to open an in-app browser which underneath uses WKWebView
    // Here one can notice that the webview is without any navigation elements
    // unlikely to the SFSafariViewController. So if navigation is desired then
    // that needs to be implemented.
    private var wkWebViewLink: some View {
        Button {
            showWKWebView = true
        } label: {
            Text("WKWebView In-App Browser")
        }
        .sheet(isPresented: $showWKWebView) {
            SwiftUIWKWebView(url: URL(string: "https://github.com/saurabh1088")!)
        }
    }
    
    // WKWebView is here presented via a NavigationLink. Using this approach
    // the webview is pushed on navigation stack similar to any other view
    // and also the default back navigation button is also provided. This
    // approach can be take if one wants to show the webview but still wants
    // the navigation bar (top navigation and/or bottom navigation) elements intact.
    private var wkWebViewInNavigationLink: some View {
        NavigationLink {
            SwiftUIWKWebView(url: URL(string: "https://github.com/saurabh1088")!)
        } label: {
            Text("WKWebView via Navigation Link")
        }
    }
    
    // Same as example above, only the webview is a part of a view
    // hierarchy made up of other SwiftUI views. This example shows how
    // webview using WKWebView can be seamlessly integrated with other
    // views in the app's view hierarchy.
    private var embeddedWkWebview: some View {
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
    
    // Here the WKWebView is given a url to load web content from local
    // html in app bundle itself. This example shows how to load local
    // html content in WKWebView
    // The difference is to create a URL from Bundle and in WKWebView one
    // needs to call loadFileURL method.
    // 1. Important point to note is that one need to make sure that the html
    // css files added locally are reflected in Project -> Build Phases -> Copy bundle resources
    // if not visible there then these files won't get copied in bundle and
    // will throw exception while trying to build URL from filepath.
    // 2. Another point to make sure is that iOS will flatten structure so
    // relative paths won't work so for example if css is being referred as
    // href="style/styles.css" then this needs to change to href="styles.css"
    private var wkWebViewLoadingLocalHTML: some View {
        NavigationLink {
            SwiftUIWKWebView(url: localHtmlContentUrl, isLocal: true)
        } label: {
            Text("WKWebView loading local static html")
        }
    }
}

struct OpenURLsInAppBrowserExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        OpenURLsInAppBrowserExamplesView()
    }
}
