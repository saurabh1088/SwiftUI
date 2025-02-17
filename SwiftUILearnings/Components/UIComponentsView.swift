//
//
// UIComponentsView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 03/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct UIComponentsView: View {
    
    var body: some View {
        VStack {
            List {
                ForEach(Components.allCases, id: \.rawValue) { component in
                    NavigationLink(component.rawValue, value: component)
                }
            }
            .navigationDestination(for: Components.self) { component in
                switch component {
                case .bottomSheet:
                    BottomSheetView()
                case .lazyVStack:
                    LazyVStackView()
                case .lists:
                    ListView()
                case .hStack:
                    HorizontalStackView()
                case .vStack:
                    VerticalStackView()
                case .textFields:
                    TextInputView()
                case .anyLayout:
                    AnyLayoutView()
                case .scrollView:
                    ScrollViewOptions()
                case .carousel:
                    CarouselView()
                case .buttons:
                    ButtonsView()
                case .tables:
                    RowColumnTableView()
                case .photosPicker:
                    PhotoPickerView()
                case .cameraCapture:
                    CameraCaptureView()
                case .radioButton:
                    RadioButtonExampleView()
                }
            }
        }
        .navigationTitle(Text(LearningTopics.uiComponents.rawValue))
    }
}

struct UIComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        UIComponentsView()
    }
}

