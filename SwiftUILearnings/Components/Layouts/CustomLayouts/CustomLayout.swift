//
//  CustomLayout.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 04/10/25.
//

import Foundation
import SwiftUI

struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        CGSize(width: 100, height: 100)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var initialX: CGFloat = 0
        var initialY: CGFloat = 0
        for subview in subviews {
            initialX = initialX + 100
            initialY = initialY + 100
            subview.place(at: CGPoint(x: initialX, y: initialY), proposal: ProposedViewSize(width: 100, height: 100))
        }
    }
}
