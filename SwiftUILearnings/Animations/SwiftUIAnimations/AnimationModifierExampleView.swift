//
//  AnimationModifierExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 11/05/24.
//

import SwiftUI
import SwiftUIViewsHelper

// TODO: Fix issue of navigation link opening and dismissing automatically the first time
// TODO: Animation type when changed need to reset back the position and start afresh
// TODO: Create a viewmodel for AnimationModifierExampleView
enum AnimationType: String, CaseIterable {
    case defaultAnimation = "Default"
    case easeIn = "Ease In"
    case easeOut = "Ease Out"
    case easeInOut = "Ease In Out"
    case interactiveSpring = "Interactive Spring"
    
    static var allAnimationTypes: [String] {
        Self.allCases.map({ $0.rawValue })
    }
    
    static func animationModifierValueFor(_ type: String) -> Animation {
        switch type {
        case AnimationType.defaultAnimation.rawValue:
            return Animation.default
        case AnimationType.easeIn.rawValue:
            return Animation.easeIn
        case AnimationType.easeOut.rawValue:
            return Animation.easeOut
        case AnimationType.easeInOut.rawValue:
            return Animation.easeInOut
        case AnimationType.interactiveSpring.rawValue:
            return Animation.interactiveSpring
        default:
            return Animation.default
        }
    }
}

struct AnimationModifierExampleView: View {
    @State private var animate = false
    @State private var selection: String?
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    private var animationType: Animation {
        AnimationType.animationModifierValueFor(selection ?? AnimationType.defaultAnimation.rawValue)
    }
    
    var body: some View {
        VStack {
            animatingView
            if #available(iOS 17.0, *) {
                SelectableValueView(label: "Choose",
                                    values: AnimationType.allAnimationTypes,
                                    selection: $selection)
            }
            animationSelectorButton
        }
    }
    
    @ViewBuilder
    private var animatingView: some View {
        VStack {
            Text("🚴")
                .font(.system(size: 40))
                .offset(x: animate ? 0 : screenWidth)
                .animation(animationType, value: animate)
        }
    }
    
    @ViewBuilder
    private var animationSelectorButton: some View {
        VStack {
            Button {
                animate.toggle()
            } label: {
                Text("Animate")
            }
            .buttonStyle(.fullScreenWide)
        }
    }
}

#Preview {
    AnimationModifierExampleView()
}
