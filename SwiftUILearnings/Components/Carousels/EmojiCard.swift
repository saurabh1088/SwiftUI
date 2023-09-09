//
//  EmojiCard.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 09/09/23.
//

import SwiftUI

enum Emoji: String {
    case smilling = "☺️"
    case grinning = "😀"
    case rofl = "🤣"
    case heartEyes = "😍"
    case upsideDown = "🙃"
    
    var title: String {
        switch self {
        case .smilling:
            return "Smile"
        case .grinning:
            return "Laughter"
        case .rofl:
            return "ROFL"
        case .heartEyes:
            return "Love"
        case .upsideDown:
            return "Quirky"
        }
    }
    
    var message: String {
        switch self {
        case .smilling:
            return "It's a beautiful day!"
        case .grinning:
            return "Very very happy!"
        case .rofl:
            return "Can't laugh more!"
        case .heartEyes:
            return "Smitten by everything!"
        case .upsideDown:
            return "Something going on!"
        }
    }
}

struct EmojiCard: View {
    let emoji: Emoji
    
    var body: some View {
        HStack {
            Text(emoji.rawValue)
                .font(.system(size: 40))
            VStack(alignment: .leading) {
                Text(emoji.title)
                    .font(.system(size: 20))
                Text(emoji.message)
                    .font(.system(size: 12))
            }
            .padding(.leading, 16)
        }
        .padding(20)
    }
}

struct EmojiCard_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCard(emoji: .grinning)
    }
}
