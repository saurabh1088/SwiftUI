//
//  TheCatAPIView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 07/11/23.
//

import SwiftUI

struct TheCatAPIView: View {
    @StateObject private var viewModel = TheCatAPIViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                if let cats = viewModel.cats {
                    ForEach(cats, id: \.id) { cat in
                        AsyncImage(url: URL(string: cat.url)!)
                    }
                }
            }
        }
        .task {
            /// `task(priority:_:)` is recommended way to call some asynchronous operation instead
            /// of `onAppear(perform:)`
            /// Benefit is, if the task is not finished and the view disappears or is removed then SwiftUI
            /// will automatically cancel the asynchronous operation in progress.
            /// Reference : https://developer.apple.com/documentation/swiftui/view/task(priority:_:)
            viewModel.fetchCats()
        }
    }
}

#Preview {
    TheCatAPIView()
}
