//
//  CustomGridLayout.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/10/25.
//

import Foundation
import SwiftUI

struct CustomGridLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let columns = 3
        let cellSize = 80.0
        let rows = (subviews.count + columns - 1) / columns
        return CGSize(width: Double(columns) * cellSize, height: Double(rows) * cellSize)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let columns = 3
        let cellSize = bounds.width / CGFloat(columns)
        for (index, subview) in subviews.enumerated() {
            let row = index / columns
            let column = index % columns
            let x = bounds.minX + CGFloat(column) * cellSize
            let y = bounds.minY + CGFloat(row) * cellSize
            let subBounds = CGRect(x: x, y: y, width: cellSize, height: cellSize)
            subview.place(at: subBounds.origin, proposal: ProposedViewSize(width: cellSize, height: cellSize))
        }
    }
}
