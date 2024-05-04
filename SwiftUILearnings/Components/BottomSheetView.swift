//
//
// BottomSheetView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 07/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI
import SwiftUIViewsHelper

struct BottomSheetView: View {
    @State private var showBottomSheet: Bool = false
    @State private var showColoredBottomSheet: Bool = false
    @State private var showMaterialStyleBottomSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            bottomSheetButton
            if #available(iOS 16.4, *) {
                bottomSheetWithBackgroundColor
                bottomSheetWithBackgroundMaterial
            }
        }
        .navigationTitle(Text("Bottom sheet examples"))
    }
    
    @ViewBuilder
    private var bottomSheetButton: some View {
        Button {
            showBottomSheet.toggle()
        } label: {
            Text("Open sheet")
        }
        .buttonStyle(.fullScreenWide)
        .sheet(isPresented: $showBottomSheet) {
            Text("🤡")
                .presentationDetents([.medium, .large])
        }
    }
    
    @available(iOS 16.4, *)
    @ViewBuilder
    private var bottomSheetWithBackgroundColor: some View {
        Button {
            showColoredBottomSheet.toggle()
        } label: {
            Text("Open colored sheet")
        }
        .buttonStyle(.fullScreenWide)
        .sheet(isPresented: $showColoredBottomSheet) {
            Text("😇")
                .presentationBackground(.yellow)
        }
    }
    
    @available(iOS 16.4, *)
    @ViewBuilder
    private var bottomSheetWithBackgroundMaterial: some View {
        Button {
            showMaterialStyleBottomSheet.toggle()
        } label: {
            Text("Open thin material sheet")
        }
        .buttonStyle(.fullScreenWide)
        .sheet(isPresented: $showMaterialStyleBottomSheet) {
            Text("🙃")
                .presentationBackground(.ultraThinMaterial)
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
