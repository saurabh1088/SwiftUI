//
//  RadioButtonExampleView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 20/10/24.
//

import SwiftUI

struct RadioButtonExampleView: View {
    
    private var radioButtonData: [RadioButtonDataModel] = [
        .init(value: "true", label: "True"),
        .init(value: "false", label: "False")
    ]
    
    @State private var selected: String = ""
    
    var body: some View {
        VStack {
            HStack {
                RadioButtonForEach(data: radioButtonData, selected: $selected)
            }
            
            Text("Selected: \(selected)")
        }
    }
}

#Preview {
    RadioButtonExampleView()
}
