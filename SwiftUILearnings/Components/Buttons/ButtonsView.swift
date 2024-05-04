//
//  ButtonsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 04/05/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct ButtonsView: View {
    var body: some View {
        ScrollView {
            
            Section {
                Button(action: {}) {
                    Text("Default")
                }
                
                Button(action: {}) {
                    Text("Bordered")
                }
                .buttonStyle(.bordered)
                
                Button(action: {}) {
                    Text("Bordered Prominent")
                }
                .buttonStyle(.borderedProminent)
            } header: {
                VStack {
                    Text("Swift UI")
                        .fontWeight(.bold)
                    Divider()
                }
            }

            Section {
                Button(action: {}) {
                    Text("Full screen wide")
                }
                .buttonStyle(.fullScreenWide)
            } header: {
                VStack {
                    Text("Full screen wide")
                        .fontWeight(.bold)
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ButtonsView()
}
