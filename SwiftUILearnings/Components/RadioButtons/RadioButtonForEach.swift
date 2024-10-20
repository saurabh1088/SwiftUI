//
//  RadioButtonForEach.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 20/10/24.
//

import SwiftUI

struct RadioButtonForEach<Data: RandomAccessCollection>: View where Data.Element == RadioButtonDataModel {
    let data: Data
    @Binding var selected: String
    
    var body: some View {
        ForEach(data) { data in
            HStack {
                selectableCircle(for: data)
                Text(data.label)
            }
        }
    }
    
    @ViewBuilder
    private func selectableCircle(for data: RadioButtonDataModel) -> some View {
        Circle()
            .fill(selected == data.value ? Color.blue : Color.clear)
            .padding(4)
            .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 1))
            )
            .frame(width: 20, height: 20)
            .contentShape(Circle())
            .onTapGesture {
                selected = data.value
            }
    }
}

#Preview {
    let radioButtonData: [RadioButtonDataModel] = [
        .init(value: "true", label: "True"),
        .init(value: "false", label: "False")
    ]
    RadioButtonForEach(data: radioButtonData, selected: .constant(String()))
}
