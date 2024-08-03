//
//  GesturesView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 30/08/23.
//

import SwiftUI
import OSLog

struct GesturesView: View {
    @State private var offsetY = 20.0
    @GestureState private var translation = 0.0
    var body: some View {
        VStack {
            VStack {
                Text("Drag Me")
            }
            .frame(width: 300, height: 300)
            .background(Color.primaryOrange)
            .offset(y: offsetY)
            .gesture(
                DragGesture().updating($translation) { value, sate, _ in
                    sate = value.translation.height
                }
                    .onEnded({ value in
                        if abs(value.translation.height) > 20 {
                            Logger.view.info("GesturesView onEnded called with height value : \(value.translation.height.description)")
                            withAnimation {
                                offsetY = value.translation.height
                            }
                        }
                    })
            )
        }
    }
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
