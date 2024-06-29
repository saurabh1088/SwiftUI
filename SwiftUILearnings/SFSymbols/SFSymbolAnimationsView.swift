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
        VStack {
            HStack {
                animationAppear
                animationDisappear
                animationBounce
            }
            
            HStack {
                animationScale
                animationPulse
                animationReplace
            }
            
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
        VStack {
            Image(systemName: "snowflake.circle.fill")
                .font(.system(size: 100))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.appear, isActive: appear)
            
            Button {
                appear.toggle()
            } label: {
                Text("Appear")
            }
        }
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationDisappear: some View {
        VStack {
            Image(systemName: "snowflake.circle")
                .font(.system(size: 100))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.disappear, isActive: disappear)
            
            Button {
                disappear.toggle()
            } label: {
                Text("Disappear")
            }
        }
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationBounce: some View {
        VStack {
            Image(systemName: "message.badge.filled.fill")
                .font(.system(size: 100))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.bounce, value: bounce)
            
            Button {
                bounce.toggle()
            } label: {
                Text("Bounce")
            }
        }
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationScale: some View {
        VStack {
            Image(systemName: "message.badge.filled.fill")
                .font(.system(size: 100))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.scale.down, isActive: scale)
            
            Button {
                scale.toggle()
            } label: {
                Text("Scale")
            }
        }
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationPulse: some View {
        VStack {
            Image(systemName: "bonjour")
                .font(.system(size: 100))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.pulse, isActive: pulse)
            
            Button {
                pulse.toggle()
            } label: {
                Text("Pulse")
            }
        }
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationReplace: some View {
        VStack {
            Image(systemName: replace ? "figure.walk" : "figure.run")
                .font(.system(size: 100))
                .foregroundStyle(Color.primaryOrange)
                .contentTransition(.symbolEffect(.replace))
            
            Button {
                replace.toggle()
            } label: {
                Text("Replace")
            }
        }
    }
}

@available(iOS 17.0, *)
extension SFSymbolAnimationsView {
    @ViewBuilder
    private var animationVariableColor: some View {
        VStack {
            Image(systemName: "touchid")
                .font(.system(size: 100))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.variableColor, isActive: variableColor)
            
            Button {
                variableColor.toggle()
            } label: {
                Text("Variable Color")
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    SFSymbolAnimationsView()
}
