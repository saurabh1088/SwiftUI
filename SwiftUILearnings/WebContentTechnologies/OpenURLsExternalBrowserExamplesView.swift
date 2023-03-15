//
//
// OpenURLsExternalBrowserExamplesView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 04/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct OpenURLsExternalBrowserExamplesView: View {
    
    // Provides instance of OpenURLAction (source : https://developer.apple.com/documentation/swiftui/environmentvalues/openurl)
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                swiftUILink
                swiftUIOpenURLLink
                openURLEnvironmentValueLink
                uiApplicationSharedOpenURLLink
            }
        }
    }
    
    // SwiftUI's Link (source : https://developer.apple.com/documentation/swiftui/link)
    // Example of using SwifUI's API Link to open a URL
    private var swiftUILink: some View {
        Link(destination: URL(string: "https://developer.apple.com/documentation/swiftui/link")!) {
            Text("SwiftUI Link")
                .font(.headline)
        }
    }
    
    // Link again, but in this case default behaviour is overriden by setting
    // openURL environment value and adding a custom logic (print statement in this case)
    // before proceeding to open URL
    private var swiftUIOpenURLLink: some View {
        Link(destination: URL(string: "https://github.com/saurabh1088")!) {
            Text("SwiftUI Link openURL")
                .font(.headline)
        }
        .environment(\.openURL, OpenURLAction(handler: { url in
            print("Opening url :: \(url)")
            return .systemAction
        }))
    }
    
    // This uses openURL environment value which holds instance of OpenURLAction
    // which further opens the url
    private var openURLEnvironmentValueLink: some View {
        Button {
            if let url = URL(string: "https://developer.apple.com/documentation/swiftui/openurlaction") {
                openURL(url) { accepted in
                    // This action is optional, if provided the action gets called
                    // before the URL is opened
                    print("Can open URL :: \(accepted ? "Yes" : "No")")
                }
            }
        } label: {
            Text("SwiftUI OpenURLAction")
                .font(.headline)
        }
    }
    
    // This uses UIApplication shared instance open method :
    // `open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:]) async -> Bool`
    private var uiApplicationSharedOpenURLLink: some View {
        Button {
            if let url = URL(string: "https://github.com/saurabh1088") {
                UIApplication.shared.open(url)
            }
        } label: {
            Text("UIApplication shared open")
                .font(.headline)
        }
    }
    
}

struct OpenURLsExternalBrowserExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        OpenURLsExternalBrowserExamplesView()
    }
}
