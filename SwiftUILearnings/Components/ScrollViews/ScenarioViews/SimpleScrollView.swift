//
//  SimpleScrollView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 27/07/24.
//

import SwiftUI

struct SimpleScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1..<100) { value in
                    Text("Row : \(value)")
                }
            }
        }
    }
}

#Preview {
    SimpleScrollView()
}
