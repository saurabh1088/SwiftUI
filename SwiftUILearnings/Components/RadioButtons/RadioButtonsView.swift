//
//  RadioButtonsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 19/10/24.
//

import SwiftUI

struct RadioButtonsView: View {
    
    @State private var trueSelected: Bool = false
    @State private var falseSelected: Bool = false
    
    var body: some View {
        VStack {
            RadioButton(isSelected: $trueSelected, label: "True")
            RadioButton(isSelected: $falseSelected, label: "False")
        }
        .onChange(of: trueSelected) { newValue in
            falseSelected = !newValue
        }
        .onChange(of: falseSelected) { newValue in
            trueSelected = !newValue
        }
    }
}

#Preview {
    RadioButtonsView()
}
