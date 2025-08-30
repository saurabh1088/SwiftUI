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
                case .anyLayout:
                    AnyLayoutView()
                case .bottomSheet:
                    BottomSheetView()
                case .buttons:
                    ButtonsView()
                case .cameraCapture:
                    CameraCaptureView()
                case .carousel:
                    CarouselView()
                case .hStack:
                    HorizontalStackView()
                case .lazyVStack:
                    LazyVStackView()
                case .lists:
                    ListView()
                case .photosPicker:
                    PhotoPickerView()
                case .pickers:
                    PickersExampleView()
                case .radioButton:
                    RadioButtonExampleView()
                case .scrollView:
                    ScrollViewOptions()
                case .tables:
                    RowColumnTableView()
                case .textFields:
                    TextInputView()
                case .vStack:
                    VerticalStackView()
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

