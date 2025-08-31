//
//  PickersExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 30/08/25.
//

import SwiftUI

class PickersExampleViewModel: ObservableObject {
    @Published var selectedColor = "Red"
    let colors = ["Red", "Green", "Blue"]
}

struct PickersExampleView: View {
    @StateObject private var viewModel = PickersExampleViewModel()
    
    var body: some View {
        VStack {
            Section("Segmented") {
                VStack {
                    Picker("Select a color", selection: $viewModel.selectedColor) {
                        ForEach(viewModel.colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("Selected color: \(viewModel.selectedColor)")
                }
                .padding()
            }
            
            Divider()
            
            Section("Wheel") {
                VStack {
                    Picker("Select a color", selection: $viewModel.selectedColor) {
                        ForEach(viewModel.colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(.wheel)
                    Text("Selected color: \(viewModel.selectedColor)")
                }
                .padding()
            }
            
            Section("Menu") {
                VStack {
                    Picker("Select a color", selection: $viewModel.selectedColor) {
                        ForEach(viewModel.colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(.menu)
                    Text("Selected color: \(viewModel.selectedColor)")
                }
                .padding()
            }
        }
    }
}

#Preview {
    PickersExampleView()
}
