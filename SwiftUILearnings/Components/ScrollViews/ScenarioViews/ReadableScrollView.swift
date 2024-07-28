//
//  ReadableScrollView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 27/07/24.
//

import SwiftUI

struct ReadableScrollView: View {
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView {
                LazyVStack {
                    Button {
                        scrollProxy.scrollTo(2)
                    } label: {
                        Text("Next")
                    }

                    
                    Section {
                        ForEach(1..<51) { value in
                            Text("\(value). Row")
                        }
                    } header: {
                        Text("Values from 1 - 50")
                            .id(1)
                    }
                    
                    Section {
                        ForEach(51..<101) { value in
                            Text("\(value). Row")
                        }
                    } header: {
                        Text("Values from 51 - 100")
                            .id(2)
                    }
                    
                    Button {
                        scrollProxy.scrollTo(1)
                    } label: {
                        Text("Previous")
                    }
                }
            }
        }
    }
}

#Preview {
    ReadableScrollView()
}
