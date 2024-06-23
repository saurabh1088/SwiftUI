//
//  SFSymbolScalesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 23/06/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct SFSymbolScalesView: View {
    @State private var imageScale = Image.Scale.small
    @State private var showAllScales = false
    
    var body: some View {
        VStack {
            VStack {
                if showAllScales {
                    VStack {
                        imageWith(scale: .small)
                        imageWith(scale: .medium)
                        imageWith(scale: .large)
                    }
                } else {
                    imageWith(scale: imageScale)
                }
            }
            
            Spacer()
            
            VStack {
                scaleSelectorPicker
                
                Button {
                    withAnimation(.interactiveSpring) {
                        showAllScales.toggle()
                    }
                } label: {
                    Text("All Scales")
                }
                .buttonStyle(.fullScreenWide)
            }
            .frame(height: 100)
        }
    }
    
    @ViewBuilder
    func imageWith(scale: Image.Scale) -> some View {
        Image(systemName: "lightspectrum.horizontal")
            .font(.system(size: 100))
            .symbolRenderingMode(.multicolor)
            .imageScale(scale)
    }
    
    @ViewBuilder
    private var scaleSelectorPicker: some View {
        HStack {
            Picker("Select scale", selection: $imageScale) {
                Text("Small").tag(Image.Scale.small)
                Text("Medium").tag(Image.Scale.medium)
                Text("Large").tag(Image.Scale.large)
            }
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    SFSymbolScalesView()
}
