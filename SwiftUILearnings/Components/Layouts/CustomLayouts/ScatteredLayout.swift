//
//  ScatteredLayout.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 04/10/25.
//

import Foundation
import SwiftUI

struct ScatteredLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        /// Using UIScreen.main.bounds.size is generally discouraged in SwiftUI, as it bypasses the flexible
        /// nature of the layout system. A more idiomatic (but less aggressive) approach would be to return
        /// proposal.replacingUnspecifiedDimensions(), which uses the suggested size or fills the available space.
        proposal.replacingUnspecifiedDimensions()
        // CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for subview in subviews {
            // Get the subview's ideal size to avoid drawing outside bounds
            let size = subview.sizeThatFits(.unspecified)
            // Compute the max allowed origin to keep the whole subview within bounds
            let maxX = bounds.maxX - size.width
            let maxY = bounds.maxY - size.height
            // Generate a random x and y coordinate within the allowed area
            let x = CGFloat.random(in: bounds.minX...(maxX > bounds.minX ? maxX : bounds.minX))
            let y = CGFloat.random(in: bounds.minY...(maxY > bounds.minY ? maxY : bounds.minY))
            // Place the subview at the random position
            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(width: size.width, height: size.height))
        }
    }
}
