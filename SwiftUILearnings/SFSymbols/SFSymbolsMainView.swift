//
//  SFSymbolsMainView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 23/06/24.
//

import SwiftUI

struct SFSymbolsMainView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            if #available(iOS 17.0, *) {
                Image(systemName: "fan.desk")
                    .font(.system(size: 100))
                    .symbolEffect(.bounce, value: animate)
            } else {
                Image(systemName: "fan.desk")
                    .font(.system(size: 100))
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

#Preview {
    SFSymbolsMainView()
}
