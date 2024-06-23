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
                Image(systemName: "rainbow")
                    .font(.system(size: 100))
                    .symbolRenderingMode(.multicolor)
                    .symbolEffect(.bounce, value: animate)
                Text("SF Symbols")
                    .font(.system(size: 50))
            } else {
                Image(systemName: "rainbow")
                    .font(.system(size: 100))
            }
            
            List(SFSymbolScenarios.allCases, id: \.rawValue) { scenario in
                NavigationLink(scenario.rawValue, value: scenario)
            }
        }
        .onAppear {
            animate.toggle()
        }
        .navigationDestination(for: SFSymbolScenarios.self) { scenario in
            switch scenario {
            case .animation:
                Text(scenario.rawValue)
            case .scales:
                SFSymbolScalesView()
            case .size:
                Text(scenario.rawValue)
            }
        }
    }
}

#Preview {
    SFSymbolsMainView()
}
