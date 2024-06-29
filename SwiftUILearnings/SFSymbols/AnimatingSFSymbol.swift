//
//  AnimatingSFSymbol.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 29/06/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct AnimatingSFSymbol: View {
    var type: SFSymbolAnimationType
    @Binding var shouldAnimate: Bool
    
    var body: some View {
        VStack {
            Image(systemName: type.animationExampleSymbolName)
                .font(.system(size: type.symbolSize))
                .foregroundStyle((type.animationExampleSymbolColor != nil) ? type.animationExampleSymbolColor! : Color.white)
            
            Button {
                shouldAnimate.toggle()
            } label: {
                Text(type.title)
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    AnimatingSFSymbol(type: .appear, shouldAnimate: .constant(true))
}
