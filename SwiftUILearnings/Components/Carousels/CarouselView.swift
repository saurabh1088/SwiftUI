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
                                          numberOfCards: 5,
                                          spacing: 16.0,
                                          peekWidth: 8.0)
        Carousel(viewModel: viewModel) {
            card
            card
            card
            card
            card
        }
    }
    
    @ViewBuilder
    private var card: some View {
        HStack {
            Image(systemName: "smiley.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.primaryYellow)
            VStack(alignment: .leading) {
                Text("Smile")
                    .font(.system(size: 20))
                Text("It's a beautiful day!")
                    .font(.system(size: 12))
            }
            .padding(.leading, 16)
        }
        .padding(20)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
