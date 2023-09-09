//
//  CarouselView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 04/09/23.
//

import SwiftUI

struct CarouselView: View {
    var widthOfCards: CGFloat {
        UIScreen.main.bounds.size.width - 48.0
    }
    
    var body: some View {
        let viewModel = CarouselViewModel(cardWidth: widthOfCards,
                                          numberOfCards: 3,
                                          spacing: 16.0,
                                          peekWidth: 8.0)
        Carousel(viewModel: viewModel) {
            EmojiCard(emoji: .smilling)
            EmojiCard(emoji: .grinning)
            EmojiCard(emoji: .rofl)
            EmojiCard(emoji: .heartEyes)
            EmojiCard(emoji: .upsideDown)
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
