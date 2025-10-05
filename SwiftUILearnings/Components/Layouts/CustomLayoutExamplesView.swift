//
//  CustomLayoutExamplesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/10/25.
//

import SwiftUI

struct CustomLayoutExamplesView: View {
    @State private var scatteredLayoutAnimate: Bool = false
    
    var body: some View {
        List {
            ForEach(CustomLayoutExample.allCases) { example in
                NavigationLink(example.rawValue, value: example)
            }
        }
        .navigationTitle(Components.layouts.rawValue)
        .navigationDestination(for: CustomLayoutExample.self) { destination in
            switch destination {
            case .simpleStackLayout:
                customLayout
            case .threeColumnGridLayout:
                customThreeColumnGridLayout
            case .scatteredLayout:
                scatteredLayout
            case .scatteredLayoutWithAnimation:
                scatteredLayoutWithAnimation
            }
        }
    }
}

extension CustomLayoutExamplesView {
    @ViewBuilder private var customThreeColumnGridLayout: some View {
        CustomThreeColumnGridLayout {
            ForEach(1..<33) { value in
                Text("\(value)")
            }
        }
    }
}

extension CustomLayoutExamplesView {
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

extension CustomLayoutExamplesView {
    @ViewBuilder private var scatteredLayout: some View {
        ScatteredLayout {
            ForEach(1..<500) { _ in
                Text("❄️")
            }
        }
    }
}

extension CustomLayoutExamplesView {
    @ViewBuilder private var scatteredLayoutWithAnimation: some View {
        ScatteredLayout {
            ForEach(1..<500) { _ in
                ScatteredText()
            }
        }
    }
}


#Preview {
    CustomLayoutExamplesView()
}

