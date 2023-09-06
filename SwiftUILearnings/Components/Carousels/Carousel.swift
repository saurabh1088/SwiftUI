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
            HStack(alignment: .center, spacing: 16) {
                cards
            }
            .offset(x: viewModel.xOffset * CGFloat(viewModel.currentCard + 1), y: 0)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        print(value)
                    })
                    .onEnded({ value in
                        if value.translation.width > 20 {
                            viewModel.currentCard = viewModel.currentCard + 1
                        }
                        
                        if value.translation.width < -20 {
                            viewModel.currentCard = viewModel.currentCard - 1
                        }
                    })
            )
            // TODO: Not working pre-iOS17.0
//            .animation(.spring, value: viewModel.currentCard)
            
            HStack {
                ForEach(0..<viewModel.numberOfCards) { index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            viewModel.currentCard = index
                        }
                }
            }
        }
    }
}

class CarouselViewModel: ObservableObject {
    @Published var currentCard = 0
    let cardWidth: CGFloat
    let numberOfCards: Int
    let spacing: CGFloat
    
    init(cardWidth: CGFloat, numberOfCards: Int, spacing: CGFloat) {
        self.cardWidth = cardWidth
        self.numberOfCards = numberOfCards
        self.spacing = spacing
    }
    
    var canvasWidth: CGFloat {
        return (cardWidth * CGFloat(numberOfCards)) + (spacing * CGFloat(numberOfCards - 1))
    }
    
    var xOffset: CGFloat {
        ((canvasWidth - UIScreen.main.bounds.width) / 2) + spacing
    }
    
    var singleCardMovement: CGFloat {
        cardWidth + spacing
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CarouselViewModel(cardWidth: 200.0,
                                          numberOfCards: 5,
                                          spacing: 16.0)
        Carousel(viewModel: viewModel) {
            Text("Card 1")
            Text("Card 2")
            Text("Card 3")
        }
    }
}
