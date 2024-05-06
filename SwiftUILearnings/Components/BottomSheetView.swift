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
    @State private var showBottomSheet = false
    @State private var showColoredBottomSheet = false
    @State private var showMaterialStyleBottomSheet = false
    @State private var showBottomSheetWithInteractiveBackground = false
    @State private var viewBackgroundColor: Color = .white
    
    var body: some View {
        VStack(spacing: 40) {
            switchBackgroundColor
            bottomSheetButton
            if #available(iOS 16.4, *) {
                bottomSheetWithBackgroundColor
                bottomSheetWithBackgroundMaterial
                bottomSheetWithInteractiveBackground
            }
        }
        .navigationTitle(Text("Bottom sheet examples"))
        .background(viewBackgroundColor)
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
    
    @ViewBuilder
    private var switchBackgroundColor: some View {
        Button {
            viewBackgroundColor = .primaryGreen
        } label: {
            Text("Change color")
        }
        .buttonStyle(.fullScreenWide)
    }
    
    /// NOTE : `.presentationBackgroundInteraction(.enabled)` doesn't works
    @available(iOS 16.4, *)
    @ViewBuilder
    private var bottomSheetWithInteractiveBackground: some View {
        Button {
            showBottomSheetWithInteractiveBackground.toggle()
        } label: {
            Text("Sheet with interactive background")
        }
        .buttonStyle(.fullScreenWide)
        .sheet(isPresented: $showBottomSheetWithInteractiveBackground) {
            Text("🤩")
                .presentationDetents([.medium])
                .presentationBackground(.ultraThinMaterial)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
