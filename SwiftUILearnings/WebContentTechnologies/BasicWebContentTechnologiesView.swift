//
//
// BasicWebContentTechnologiesView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 03/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

/// One needs to make sure to use right technology for the application.
///
/// `SFSafariViewController`
/// If a browser like experience is expected with no need for deep customization, one can definately better use `SFSafariViewController`
/// `SFSafariViewController` is built on top of `WKWebView`
///
/// `UIWebView` : NOW DEPRECATED
/// If app still used `UIWebView` one should migrate towards more responsive `WKWebView`
///
/// `WKWebView`
/// Part of `WebKit` frameworkUsed to handle application with need interaction with web content.
/// Can be used to write CSS based or JavaScript based UI.
/// Also can be used to develop a browser itself.
/// `WKWebView` gives automatic protection for the application's code and data by separating web content to different process.
/// Being in a different process it proviced fast experience and secutity advantages over malicious factors.
/// If customization of web content to display is required then use `WKWebView`
/// If requirement is to interact with the web content then use `WKWebView`
///
/// Quoting from apple's documentation itself (source : https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller)
///
/// _If your app lets users view websites from anywhere on the Internet, use the SFSafariViewController class. If your app customizes, interacts with, or controls the display of web content, use the WKWebView class._
struct BasicWebContentTechnologiesView: View {
    
    var body: some View {
        VStack {
            OpenURLsExternalBrowserExamplesView()
        }
        .navigationTitle("Web Content Technologies")
    }
}

struct BasicWebContentTechnologiesView_Previews: PreviewProvider {
    static var previews: some View {
        BasicWebContentTechnologiesView()
    }
}
