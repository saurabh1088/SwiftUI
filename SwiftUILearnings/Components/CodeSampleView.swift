//
//  CodeSampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 22/10/25.
//

import SwiftUI

struct CodeSampleView: View {
    
    var body: some View {
        CodeWebView(html: html)
    }
    
    let html = """
    <!DOCTYPE html>
    <html>
    <head>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js@11.6.0/styles/xcode.min.css">
      <script src="https://cdn.jsdelivr.net/npm/highlight.js@11.6.0/lib/highlight.min.js"></script>
      <script>hljs.highlightAll();</script>
      <style>
        body { background: transparent; margin: 0; }
        pre { font-size: 16px; font-family: 'Menlo', monospace; }
      </style>
    </head>
    <body>
    <pre><code class="swift">
    struct Person {
        let name: String
        let age: Int
    }
    </code></pre>
    </body>
    </html>
    """
}

#Preview {
    CodeSampleView()
}
