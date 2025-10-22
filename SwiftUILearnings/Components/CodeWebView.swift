//
//  CodeWebView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 22/10/25.
//

import SwiftUI
import WebKit

struct CodeWebView: UIViewRepresentable {
    let html: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(html, baseURL: nil)
    }
}
