//
//
// SafariWebView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 04/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI
import SafariServices

/// `SafariWebView` is using `SFSafariViewController` wrapped with `UIViewControllerRepresentable`
/// to be used in SwiftUI views as at this moment there isn't any direct alternative SwiftUI API available.
///
/// `SFSafariViewController` is great when the intent is just to showcase a webpage to user without leaving
/// the app. Web pages open in `SFSafariViewController` open like an extention to the app itself and control
/// doesn't goes to Safari app unlike opening of URLs as discussed in `OpenURLsExternalBrowserExamplesView`
/// `SFSafariViewController` is itself built on top of `WKWebView`
/// Though one cannot create and pass a session cookie object to `SFSafariViewController` from the app itself
/// however the `SFSafariViewController` will share cookies and other website data with Safari.
///
/// `SFSafariViewController` is preferred approach for scenarios like oAuth sign in flow, for the user-agent
/// presented for oAuth flow. Reason preferring `SFSafariViewController` over `WKWebView` is to avoid
/// embedded use-agent related vulnerability. This is mentioned in details in https://www.rfc-editor.org/rfc/rfc8252#section-8.12
/// This is the reason the popular iOS framework for handling oAuth flow i.e. AppAuth https://github.com/openid/AppAuth-iOS
/// uses `SFSafariViewController` by default.
///
/// The app which launches a `SFSafariViewController` doesn't have access to the user's activity on the
/// browser instance, it cannot access autofill data, browsing history or website data.
/// So there is no need to secure data between the app and Safari.
///
/// For sharing data so that a user logs in only once and not everytime a `SFSafariViewController` opens
/// up till session is valid one need to use `ASWebAuthenticationSession`
///
struct SafariWebView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SFSafariViewController
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariWebView>) -> SFSafariViewController {
        
        // Setting a configuration for SFSafariViewController is optional as it can
        // be initialized without a configuration object as well.
        let configuration = SFSafariViewController.Configuration()
        // Default barCollapsingEnabled configuration is true, so if configuration
        // is created for SFSafariViewController by default when page is scrolled
        // then top and bottom bars collapse. The bottom one collapses completely
        // while the top bar minimizes to show page url only.
        // Set it to false after creating SFSafariViewController.Configuration object
        // to disable collapsing effect.
        configuration.barCollapsingEnabled = false

        return SFSafariViewController(url: url,
                                      configuration: configuration)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariWebView>) {
    }
}

struct SafariWebView_Previews: PreviewProvider {
    static var previews: some View {
        SafariWebView(url: URL(string: "https://github.com/saurabh1088")!)
    }
}

//TODO: Private Click Measurement
// https://webkit.org/blog/11529/introducing-private-click-measurement-pcm/
