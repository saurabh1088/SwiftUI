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

// MARK: -----------------------------------------------------------------------
// MARK: BottomSheetView definition
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
    
    
}

// MARK: -----------------------------------------------------------------------
// MARK: Previews
/// One can't add these previews to say an extension of BottomSheetView for organising the code. The canvas
/// simply won't show anything, actually won't open at all. Possibly the previews need to be part of file and not
/// inside any type definition.
/// One can also have a file containing only previews check below example :
/// https://github.com/saurabh1088/swift-ui-views-helper/blob/main/Sources/SwiftUIViewsHelper/Previews/Previews.swift
#Preview("Dark Mode") {
    BottomSheetView()
        .preferredColorScheme(.dark)
}

#Preview("Light Mode") {
    BottomSheetView()
        .preferredColorScheme(.light)
}

@available(iOS 17.0, *)
#Preview("Landscape Left", traits: .landscapeLeft) {
    BottomSheetView()
}

@available(iOS 17.0, *)
#Preview("Landscape Right", traits: .landscapeRight) {
    BottomSheetView()
}

// MARK: -----------------------------------------------------------------------
// MARK: Extensions
extension BottomSheetView {
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
}

extension BottomSheetView {
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
}

extension BottomSheetView {
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

extension BottomSheetView {
    @ViewBuilder
    private var switchBackgroundColor: some View {
        Button {
            viewBackgroundColor = .primaryGreen
        } label: {
            Text("Change color")
        }
        .buttonStyle(.fullScreenWide)
    }
}

extension BottomSheetView {
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
