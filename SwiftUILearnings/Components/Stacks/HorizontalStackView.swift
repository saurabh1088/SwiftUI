//
//
// HorizontalStackView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 07/06/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        
// TODO: https://www.appcoda.com/swiftui-anylayout/

import SwiftUI

/**
 `HStack`
 HStack arranges subviews passed in horizontal line.
 HStack will initialise and render all views passed to it, irrespective of wether App is currently showing those or
 not. If there are many views instead LazyHStack should be used.
 */
struct HorizontalStackView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<5) { i in
                        switch i {
                        case 0:
                            simpleHStackView
                                .background(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                                .frame(width: 300, height: 100)
                        case 1:
                            hStackWithBottomAlignment
                                .background(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                                .frame(width: 300, height: 100)

                        case 2:
                            hStackWithTopAlignment
                                .background(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                                .frame(width: 300, height: 100)

                        case 3:
                            hStackWithCenterAlignment
                                .background(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                                .frame(width: 300, height: 100)

                        case 4:
                            hStackWithThreeSubviews
                                .background(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                                .frame(width: 300, height: 100)

                        default:
                            simpleHStackView
                                .background(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                                .frame(width: 300, height: 100)

                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 40)
        } else {
            hStackWithThreeSubviews
        }
    }
    
    @ViewBuilder
    private var simpleHStackView: some View {
        HStack {
            Text("🚗")
            Text("🛺")
        }
    }
    
    @ViewBuilder
    private var hStackWithBottomAlignment: some View {
        HStack(alignment: .bottom) {
            VStack {
                Text("🌊")
                Text("🌊")
                Text("🌊")
            }
            Text("🚤")
        }
    }
    
    @ViewBuilder
    private var hStackWithTopAlignment: some View {
        HStack(alignment: .top) {
            VStack {
                Text("🌊")
                Text("🌊")
                Text("🌊")
            }
            Text("🚤")
        }
    }
    
    @ViewBuilder
    private var hStackWithCenterAlignment: some View {
        HStack(alignment: .center) {
            VStack {
                Text("🌊")
                Text("🌊")
                Text("🌊")
            }
            Text("🚤")
        }
    }
    
    @ViewBuilder
    private var hStackWithThreeSubviews: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                Text("📱")
            }
            HStack {
                Spacer()
                Text("🖥")
                Spacer()
                Text("📱")
            }
            HStack {
                Text("💻")
                Spacer()
                Text("🖥")
                Spacer()
                Text("📱")
            }
        }
        .padding(16)
    }
}

struct HorizontalStackView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStackView()
    }
}
