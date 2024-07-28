//
//  PinnedScrollView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 27/07/24.
//

import SwiftUI

struct PinnedScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(1..<11) { value in
                        Text("\(value). Row")
                    }
                } header: {
                    Text("Values from 1-10")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                }
                
                Section {
                    ForEach(11..<21) { value in
                        Text("\(value). Row")
                    }
                } header: {
                    Text("Values from 11-20")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                }
                
                Section {
                    ForEach(21..<31) { value in
                        Text("\(value). Row")
                    }
                } header: {
                    Text("Values from 21-30")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                }
            }
        }
    }
}

#Preview {
    PinnedScrollView()
}
