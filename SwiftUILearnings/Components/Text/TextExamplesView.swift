//
//  TextExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/10/25.
//

import SwiftUI

struct TextExamplesView: View {
    var body: some View {
        VStack {
            simpleConcatenation
            styledText
            emphasizedWord
            starsInText
        }
    }
    
    @ViewBuilder var simpleConcatenation: some View {
        Text("Hello").bold()
        + Text(" World") + Text("!")
    }
    
    @ViewBuilder var styledText: some View {
        Text("SwiftUI ").font(.title).foregroundColor(.blue)
        + Text("Text ").italic().foregroundColor(.red)
        + Text("Concatenation").underline()
    }
    
    @ViewBuilder var emphasizedWord: some View {
        Text("This is ")
        + Text("important").bold().foregroundColor(.orange)
        + Text("!")
    }
    
    @ViewBuilder var starsInText: some View {
        Text("Feature rating: ")
        + Text(Image(systemName: "star.fill")).foregroundColor(.yellow)
        + Text(" 5/5")
    }
}

#Preview {
    TextExamplesView()
}
