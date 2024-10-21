//
//
// SwiftUIWKWebView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 05/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI
import WebKit

struct SwiftUIWKWebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    var url: URL
    var isLocal: Bool = false
    
    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()
        wkWebView.navigationDelegate = context.coordinator
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        if isLocal {
            uiView.loadFileURL(url, allowingReadAccessTo: url)
        } else {
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: SwiftUIWKWebView

        init(_ parent: SwiftUIWKWebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let scriptPath = Bundle.main.path(forResource: "ExternalJavaScriptFile", ofType: "js") {
                do {
                    let jsCode = try String(contentsOfFile: scriptPath, encoding: .utf8)
                    webView.evaluateJavaScript(jsCode) { result, error in
                        if let error = error {
                            print("Error executing JavaScript: \(error)")
                        } else {
                            print("JavaScript executed successfully: \(result ?? "No result")")
                        }
                    }
                } catch {
                    print("Error loading JavaScript file: \(error)")
                }
            }
        }
    }
}

struct SwiftUIWKWebView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIWKWebView(url: URL(string: "https://github.com/saurabh1088")!)
    }
}
