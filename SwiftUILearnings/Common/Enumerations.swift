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
    case augmentedReality = "Augmented Reality"
    case charts = "Charts"
    case dataEssentials = "Data Essentials"
    case eventsKit = "Events"
    case geometryReader = "Geometry Reader"
    case notifications = "Notifications"
    case pdfFiles = "PDF Files"
    case speech = "Speech"
    case testPitch = "Test Pitch"
    case uiComponents = "UI Components"
    case uiGestures = "UI Gestures"
    case webContentTechnologies = "Web Content Technologies"
}

enum Components: String, CaseIterable {
    case bottomSheet = "Bottom Sheets"
    case lazyVStack = "Lazy VStack"
    case lists = "Lists"
    case hStack = "HStack"
    case vStack = "VStack"
    case textFields = "Text Fields"
    case anyLayout = "Any Layout"
    case scrollView = "Scroll View"
    case carousel = "Carousels"
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
