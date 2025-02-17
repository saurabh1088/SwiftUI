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
    case lazyVStack = "Lazy VStack"
    case lists = "Lists"
    case hStack = "HStack"
    case vStack = "VStack"
    case textFields = "Text Fields"
    case anyLayout = "Any Layout"
    case scrollView = "Scroll View"
    case carousel = "Carousels"
    case tables = "Tables"
    case photosPicker = "Photos Picker"
    case cameraCapture = "Camera Capture"
    case radioButton = "Radio Button"
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
