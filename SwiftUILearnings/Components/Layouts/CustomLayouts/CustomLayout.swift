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
        for subview in subviews {
            subview.place(at: CGPoint(x: 0, y: 0), proposal: ProposedViewSize(width: 100, height: 100))
        }
    }
}
