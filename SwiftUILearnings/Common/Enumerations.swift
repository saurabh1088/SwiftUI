//
//
// Enumerations.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 15/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation

enum LearningTopics: String, CaseIterable {
    case animations = "Animations"
    case augmentedReality = "Augmented Reality"
    case apis = "APIs"
    case charts = "Charts"
    case dataEssentials = "Data Essentials"
    case debug = "Debug"
    case eventsKit = "Events"
    case faceId = "Face ID"
    case geometryReader = "Geometry Reader"
    case notifications = "Notifications"
    case pdfFiles = "PDF Files"
    case sfSymbols = "SF Symbols"
    case speech = "Speech"
    case testPitch = "Test Pitch"
    case uiComponents = "UI Components"
    case uiGestures = "UI Gestures"
    case webContentTechnologies = "Web Content Technologies"
    case widgetExtension = "Widget Extension"
}

enum Components: String, CaseIterable {
    case bottomSheet = "Bottom Sheets"
    case buttons = "Buttons"
    case cameraCapture = "Camera Capture"
    case carousel = "Carousels"
    case hStack = "HStack"
    case layouts = "Layouts"
    case lazyVStack = "Lazy VStack"
    case lists = "Lists"
    case photosPicker = "Photos Picker"
    case pickers = "Pickers"
    case radioButton = "Radio Button"
    case scrollView = "Scroll View"
    case tables = "Tables"
    case text = "Text"
    case textFields = "Text Fields"
    case vStack = "VStack"
}

enum ListViewTypes: String, CaseIterable {
    case simple = "Simple"
    case refreshable = "Refreshable"
    case grouped = "Grouped"
    case inset = "Inset"
    case insetGrouped = "Inset Grouped"
    case plain = "Plain"
    case sidebar = "Sidebar"
    case multipleSelection = "Multiple Selection"
}

enum AnimationScenarios: String, CaseIterable {
    case swiftUI = "SwiftUI"
    case lottie = "Lottie"
}

enum SwiftUIAnimationScenarios: String, CaseIterable {
    case withAnimation = "With Animation"
    case withAnimationViewModifier = "Animation View Modifier"
}

enum SFSymbolScenarios: String, CaseIterable {
    case animation = "Animations"
    case scales = "Scales"
    case size = "Size"
}

enum ScrollViewScenarios: String, CaseIterable, Identifiable {
    case simple = "Simple"
    case readable = "Readable"
    case pinned = "Pinned"
    
    var id: String { rawValue }
}

enum GeometryReaderExamples: String, CaseIterable, Identifiable {
    case defaultCoordinates
    case parentAndChild
    
    var displayName: String {
        switch self {
        case .defaultCoordinates:
            "Default Coordinate space"
        case .parentAndChild:
            "Parent & Child Scenario"
        }
    }
    
    var id: String { rawValue }
}

enum LayoutExample: String, CaseIterable, Identifiable {
    case anyLayout = "Any Layout"
    case customLayout = "Custom Layout"
    
    var id: String { rawValue }
}

enum CustomLayoutExample: String, CaseIterable, Identifiable {
    case simpleStackLayout = "Simple Stack Layout"
    case threeColumnGridLayout = "Three Column Grid Layout"
    case scatteredLayout = "Scattered Layout"
    case scatteredLayoutWithAnimation = "Scattered Layout with Animation"
    
    var id: String { rawValue }
}

