//
//  ComponentScrollView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 31/07/23.
//

import SwiftUI

struct ComponentScrollView: View {
    @State private var showModal: Bool = false
    var colors: [Color] = [.red, .green, .orange, .blue, .cyan, .yellow, .purple, .pink, .brown, .mint]
    var body: some View {
        VStack {
            Button("Show Scroll View") {
                showModal = true
            }
        }
        .fullScreenCover(isPresented: $showModal) {
            if #available(iOS 17.0, *) {
                scrollViewWithPagingVertical
            } else {
                scrollViewIOS16OrBelow
            }
        }
    }
    
    @available(iOS 17.0, *)
    @ViewBuilder
    private var scrollViewWithPagingHorizontal: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(width: 300, height: 100)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .safeAreaPadding(.horizontal, 40)
    }
    
    @available(iOS 17.0, *)
    @ViewBuilder
    private var scrollViewWithPagingVertical: some View {
        ScrollView {
            ForEach(0..<10) { i in
                Text("Card \(i)")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .frame(height: 800)
                    .background(colors[i])
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 0))
                    .scrollTargetLayout()
            }
        }
        .frame(height: UIScreen.main.bounds.size.height)
        .scrollTargetBehavior(.paging)
    }
    
    @ViewBuilder
    private var scrollViewIOS16OrBelow: some View {
        ScrollView {
            LazyHStack {
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(width: 300, height: 100)
                }
            }
        }
    }
}

#Preview {
    ComponentScrollView()
}


@available(iOS 17.0, *)
struct CustomScrollTargetBehavior: ScrollTargetBehavior {
    var targets = [0.0,
                   932.0 * 1,
                   932.0 * 2,
                   932.0 * 3,
                   932.0 * 4,
                   932.0 * 5,
                   932.0 * 6,
                   932.0 * 7,
                   932.0 * 8,
                   932.0 * 9]
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if context.velocity.dy > 0 {
            target.rect.origin.y = 820
            print(target.anchor)
        } else if context.velocity.dy < 0 {
            target.rect.origin.y = 0
        }
        
    }
    
    func nextTarget(_ value: CGFloat) -> CGFloat {
        for i in targets {
            if value < i {
                return i
            }
        }
        return 0.0
    }
}

@available(iOS 17.0, *)
extension ScrollTargetBehavior where Self == CustomScrollTargetBehavior {
    static var custom: CustomScrollTargetBehavior { .init() }
}
