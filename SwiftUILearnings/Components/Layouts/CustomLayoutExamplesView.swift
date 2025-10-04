//
//  CustomLayoutExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/10/25.
//

import SwiftUI

struct CustomLayoutExamplesView: View {
    var body: some View {
        CustomThreeColumnGridLayout {
            ForEach(1..<33) { value in
                Text("\(value)")
            }
        }
    }
}

#Preview {
    CustomLayoutExamplesView()
}
