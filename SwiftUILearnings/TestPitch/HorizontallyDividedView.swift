//
//  HorizontallyDividedView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 10/08/24.
//

import SwiftUI

struct HorizontallyDividedView<LeftContent: View, RightContent: View>: View {
    @ViewBuilder var leftContent: () -> LeftContent
    @ViewBuilder var rightContent: () -> RightContent
    
    var body: some View {
        HStack {
            leftContent()
            Spacer()
            Divider()
            Spacer()
            rightContent()
        }
    }
}

#Preview {
    HorizontallyDividedView {
        Text("Left")
    } rightContent: {
        Text("Right")
    }
}
