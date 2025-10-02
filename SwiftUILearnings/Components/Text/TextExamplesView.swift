//
//  TextExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/10/25.
//

import SwiftUI

struct TextExamplesView: View {
    var body: some View {
        ScrollView {
            simpleConcatenation
            styledText
            emphasizedWord
            starsInText
            vibrantHeading
            statusMessage
            userBadge
            alertText
            achievementLine
        }
    }
    
    @ViewBuilder var simpleConcatenation: some View {
        Text("Say Hello").bold()
        + Text("To the World of") + Text("!")
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
    
    @ViewBuilder var vibrantHeading: some View {
        Text("Welcome ").font(.largeTitle).foregroundColor(.purple).bold()
        + Text("to ").font(.title).foregroundColor(.orange)
        + Text("SwiftUI").font(.largeTitle).italic().foregroundColor(.blue)
        + Text("!").font(.title).foregroundColor(.green).bold()
    }
    
    @ViewBuilder var statusMessage: some View {
        Text("✔ ").font(.title).foregroundColor(.green)
        + Text(" Your file was ").font(.body).foregroundColor(.primary)
        + Text("successfully uploaded").font(.body).foregroundColor(.blue).italic()
        + Text(".").font(.body)
    }
    
    @ViewBuilder var userBadge: some View {
        Text(Image(systemName: "person.crop.circle.fill")).font(.title).foregroundColor(.pink)
        + Text(" VIP ").font(.headline).foregroundColor(.pink).bold()
        + Text("Member").font(.body).foregroundColor(.secondary)
    }
    
    @ViewBuilder var alertText: some View {
        Text("Warning: ").font(.headline).foregroundColor(.red).bold()
        + Text("Your subscription is expiring soon.").font(.body).foregroundColor(.primary)
        + Text(" Renew now!").font(.body).foregroundColor(.blue).underline()
    }
    
    @ViewBuilder var achievementLine: some View {
        Text("🏆 ").font(.title)
        + Text("Congratulations ").font(.headline).foregroundColor(.yellow).bold()
        + Text("on reaching ").font(.body)
        + Text("Level 10!").font(.headline).foregroundColor(.orange).italic()
    }
}

#Preview {
    TextExamplesView()
}
