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
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct SwiftUIWKWebView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIWKWebView(url: URL(string: "https://github.com/saurabh1088")!)
    }
}
