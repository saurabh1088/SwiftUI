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
        VStack {
            scatteredLayoutWithAnimation
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
    
    @ViewBuilder private var scatteredLayout: some View {
        ScatteredLayout {
            ForEach(1..<150) { _ in
                Text("❄️")
            }
        }
    }
    
    @ViewBuilder private var scatteredLayoutWithAnimation: some View {
        ScatteredLayout {
            ForEach(1..<150) { _ in
                VStack {
                    if scatteredLayoutAnimate {
                        Text("❄️")
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int.random(in: 1...5))) {
                        withAnimation(.easeInOut) {
                            scatteredLayoutAnimate.toggle()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CustomLayoutExamplesView()
}
