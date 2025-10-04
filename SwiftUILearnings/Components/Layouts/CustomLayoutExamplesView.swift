//
//  CustomLayoutExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/10/25.
//

import SwiftUI

struct CustomLayoutExamplesView: View {
    var body: some View {
        VStack {
            customLayout
        }
    }
    
    @ViewBuilder private var customThreeColumnGridLayout: some View {
        CustomThreeColumnGridLayout {
            ForEach(1..<33) { value in
                Text("\(value)")
            }
        }
    }
    
    @ViewBuilder private var customLayout: some View {
        CustomLayout {
            Image(systemName: "gearshift.layout.sixspeed")
                .resizable()
                .frame(width: 50, height: 50)
            
            Image(systemName: "globe")
                .resizable()
                .frame(width: 25, height: 25)
        }
    }
}

#Preview {
    CustomLayoutExamplesView()
}
