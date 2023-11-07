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
        .onAppear {
            viewModel.fetchCats()
        }
    }
    
}

#Preview {
    TheCatAPIView()
}
