//
//  Carousel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 05/09/23.
//

import SwiftUI

struct Carousel<Cards: View>: View {
    @ObservedObject var viewModel: CarouselViewModel
    let cards: Cards
    
    init(viewModel: CarouselViewModel, @ViewBuilder cards: () -> Cards) {
        self.viewModel = viewModel
        self.cards = cards()
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: viewModel.spacingBetweenCards) {
                cards
                    .frame(width: viewModel.singleCardWidth)
                    .background(Color.primaryRed)
            }
            .offset(x: viewModel.relevantXOffset, y: 0)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        print(value)
                    })
                    .onEnded({ value in
                        if value.translation.width > 20 {
                            viewModel.displayedCardIndex = viewModel.displayedCardIndex - 1
                        }
                        
                        if value.translation.width < -20 {
                            viewModel.displayedCardIndex = viewModel.displayedCardIndex + 1
                        }
                    })
            )
            .animation(.easeInOut, value: viewModel.displayedCardIndex)
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CarouselViewModel(singleCardWidth: 200.0,
                                          numberOfCards: 5,
                                          spacingBetweenCards: 20.0,
                                          visibleWidthOfHiddenCardAroundEdges: 5.0)
        Carousel(viewModel: viewModel) {
            EmojiCard(emoji: .smilling)
            EmojiCard(emoji: .grinning)
            EmojiCard(emoji: .rofl)
            EmojiCard(emoji: .heartEyes)
            EmojiCard(emoji: .upsideDown)
        }
    }
}
