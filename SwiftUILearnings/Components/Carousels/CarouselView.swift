//
//  CarouselView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 04/09/23.
//

import SwiftUI

struct CarouselView: View {
    @StateObject private var viewModel = CarouselViewModel(singleCardWidth: UIScreen.main.bounds.size.width - 48.0,
                                                           numberOfCards: 5,
                                                           spacingBetweenCards: 16.0,
                                                           visibleWidthOfHiddenCardAroundEdges: 8.0)
    
    var body: some View {
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
