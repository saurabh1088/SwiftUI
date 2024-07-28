//
//  ScrollWithReaderView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 22/09/23.
//

import SwiftUI
import Combine

struct ScrollWithReaderView: View {
    @Binding var scrollBackToTop: Bool
    @Namespace var topScrollBox
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView {
                VStack {
                    scrollBox(index: 0)
                    
                    ForEach(1..<20) { index in
                        scrollBox(index: index)
                    }
                    
                    Button {
                        scrollProxy.scrollTo(topScrollBox, anchor: .top)
                    } label: {
                        Text("Back to top")
                            .padding(20)
                            .frame(width: UIScreen.main.bounds.size.width - 32, height: 100)
                            .background(Color.primaryVeryDarkBlue)
                    }
                }
                .onReceive(Just(scrollBackToTop), perform: { value in
                    DispatchQueue.main.async {
                        withAnimation {
                            scrollProxy.scrollTo(topScrollBox, anchor: .top)
                        }
                    }
                })
            }
        }
    }
    
    @ViewBuilder
    func scrollBox(index: Int) -> some View {
        VStack {
            if index == 0 {
                Text("🏁 \(index)")
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.size.width - 32, height: 100)
                    .background(Color.primaryRed)
                    .id(topScrollBox)
            } else {
                Text("📦 \(index)")
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.size.width - 32, height: 100)
                    .background(Color.primaryOrange)
            }
        }
    }
}

#Preview {
    ScrollWithReaderView(scrollBackToTop: .constant(false))
}
