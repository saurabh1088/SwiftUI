//
//  SFSymbolSizeView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 24/06/24.
//

import SwiftUI

struct SFSymbolSizeView: View {
    @State private var fontSize: CGFloat = 10.0
    
    var body: some View {
        VStack {
            List {
                textAndSymbolWith(fontSize: fontSize)
            }
            
            Spacer()
            
            HStack {
                Button {
                    fontSize += 10.0
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 40))
                        .symbolRenderingMode(.multicolor)
                }
                
                Button {
                    fontSize -= 10.0
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 40))
                        .symbolRenderingMode(.multicolor)
                }

            }
        }
        .navigationTitle(Text(SFSymbolScenarios.size.rawValue))
    }
    
    
    @ViewBuilder
    func textAndSymbolWith(fontSize: CGFloat) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: "circle.hexagongrid.fill")
                .font(.system(size: fontSize))
                .symbolRenderingMode(.multicolor)
            
            Text("size \(Int(fontSize))")
                .font(.system(size: fontSize))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    SFSymbolSizeView()
}
