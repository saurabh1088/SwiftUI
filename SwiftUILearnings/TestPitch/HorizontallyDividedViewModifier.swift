//
//  HorizontallyDividedViewModifier.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 10/08/24.
//

import SwiftUI

struct HorizontallyDividedViewModifier<ToContent: View>: ViewModifier {
    @ViewBuilder var toContent: () -> ToContent
    
    func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Divider()
            Spacer()
            toContent()
        }
    }
}

extension View {
    func divideHorizontallyWith<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        modifier(HorizontallyDividedViewModifier(toContent: content))
    }
}

#Preview {
    Text("Left")
        .divideHorizontallyWith {
            Text("Right")
        }
}
