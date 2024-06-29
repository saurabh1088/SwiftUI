//
//  SFSymbolAnimationsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 24/06/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct SFSymbolAnimationsView: View {
    @State private var appear = false
    @State private var disappear = false
    @State private var bounce = false
    @State private var scale = false
    @State private var pulse = false
    @State private var replace = false
    @State private var variableColor = false
    
    var body: some View {
        ScrollView {
            HStack {
                animationAppear
                animationDisappear
                animationBounce
            }
            
            Divider()
            
            HStack {
                animationScale
                animationPulse
                animationReplace
            }
            
            Divider()
            
            HStack {
                animationVariableColor
            }
        }
        .navigationTitle(SFSymbolScenarios.animation.rawValue)
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationAppear: some View {
        AnimatingSFSymbol(type: .appear, shouldAnimate: $appear)
            .symbolEffect(.appear, isActive: !appear)
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationDisappear: some View {
        AnimatingSFSymbol(type: .disappear, shouldAnimate: $disappear)
            .symbolEffect(.disappear, isActive: disappear)
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationBounce: some View {
        AnimatingSFSymbol(type: .bounce, shouldAnimate: $bounce)
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.bounce, value: bounce)
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationScale: some View {
        AnimatingSFSymbol(type: .scale, shouldAnimate: $scale)
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.scale.down, isActive: scale)
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationPulse: some View {
        AnimatingSFSymbol(type: .pulse, shouldAnimate: $pulse)
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.pulse, isActive: pulse)
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationReplace: some View {
        AnimatingSFSymbol(type: .replace(replace), shouldAnimate: $replace)
            .contentTransition(.symbolEffect(.replace))
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationVariableColor: some View {
        AnimatingSFSymbol(type: .variableColor, shouldAnimate: $variableColor)
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.variableColor, isActive: variableColor)
    }
}

@available(iOS 17.0, *)
#Preview {
    SFSymbolAnimationsView()
}
