//
//  TextExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/10/25.
//

import SwiftUI

struct TextExamplesView: View {
    var body: some View {
        simpleConcatenation
    }
    
    @ViewBuilder var simpleConcatenation: some View {
        Text("Hello").bold() + Text(" World") + Text("!")
    }
}

#Preview {
    TextExamplesView()
}
