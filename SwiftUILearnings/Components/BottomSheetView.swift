//
//
// BottomSheetView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 07/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct BottomSheetView: View {
    @State private var showBottomSheet: Bool = false
    var body: some View {
        VStack(spacing: 40) {
            Text("Bottom sheet example")
            
            Button {
                showBottomSheet = true
            } label: {
                Text("Open sheet")
            }
            .sheet(isPresented: $showBottomSheet) {
                Text("🤡")
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
