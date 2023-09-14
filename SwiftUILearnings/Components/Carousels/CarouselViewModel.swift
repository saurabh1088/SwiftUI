//
//  CarouselViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 14/09/23.
//

import Foundation
import SwiftUI

class CarouselViewModel: ObservableObject {
    @Published var displayedCardIndex = 0
    let singleCardWidth: CGFloat
    let numberOfCards: Int
    let spacingBetweenCards: CGFloat
    let visibleWidthOfHiddenCardAroundEdges: CGFloat
    
    init(singleCardWidth: CGFloat, numberOfCards: Int, spacingBetweenCards: CGFloat, visibleWidthOfHiddenCardAroundEdges: CGFloat) {
        self.singleCardWidth = singleCardWidth
        self.numberOfCards = numberOfCards
        self.spacingBetweenCards = spacingBetweenCards
        self.visibleWidthOfHiddenCardAroundEdges = visibleWidthOfHiddenCardAroundEdges
    }
    
    var totalHorizontalScrollableAreaForAllCards: CGFloat {
        return (singleCardWidth * CGFloat(numberOfCards)) + (spacingBetweenCards * CGFloat(numberOfCards - 1))
    }
    
    var initialXOffset: CGFloat {
        ((totalHorizontalScrollableAreaForAllCards - UIScreen.main.bounds.size.width) / 2) + spacingBetweenCards + visibleWidthOfHiddenCardAroundEdges
    }
    
    var singleCardMovement: CGFloat {
        visibleWidthOfHiddenCardAroundEdges + singleCardWidth  + visibleWidthOfHiddenCardAroundEdges
    }
    
    var relevantXOffset: CGFloat {
        initialXOffset - (singleCardMovement * CGFloat(displayedCardIndex))
    }
}
