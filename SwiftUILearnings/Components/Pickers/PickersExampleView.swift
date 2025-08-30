//
//  PickersExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 30/08/25.
//

import SwiftUI

struct PickersExampleView: View {
    @State private var selectedColor = "Red"
    let colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        VStack {
            Section("Segmented") {
                VStack {
                    Picker("Select a color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("Selected color: \(selectedColor)")
                }
                .padding()
            }
            
            Divider()
            
            Section("Wheel") {
                VStack {
                    Picker("Select a color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(.wheel)
                    Text("Selected color: \(selectedColor)")
                }
                .padding()
            }
            
            Section("Menu") {
                VStack {
                    Picker("Select a color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(.menu)
                    Text("Selected color: \(selectedColor)")
                }
                .padding()
            }
        }
    }
}

#Preview {
    PickersExampleView()
}
