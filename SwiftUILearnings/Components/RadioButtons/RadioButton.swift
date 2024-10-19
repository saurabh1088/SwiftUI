//
//  RadioButton.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 19/10/24.
//

import SwiftUI

struct RadioButton: View {
    
    @Binding var isSelected: Bool
    var label: String?
    
    var body: some View {
        HStack {
            selectableCircle
            Text(label ?? "")
        }
    }
    
    @ViewBuilder private var selectableCircle: some View {
        Circle()
            .fill(isSelected ? Color.blue : Color.clear)
            .padding(4)
            .overlay(
              Circle()
                .stroke(Color.gray, lineWidth: 1)
            )
            .frame(width: 20, height: 20)
            .contentShape(Circle())
            .onTapGesture {
                isSelected.toggle()
            }
    }
}

#Preview {
    VStack {
        RadioButton(isSelected: .constant(true))
        RadioButton(isSelected: .constant(false))
    }
    
}
