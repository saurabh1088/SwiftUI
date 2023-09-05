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
    case geometryReader = "Geometry Reader"
    case webContentTechnologies = "Web Content Technologies"
    case dataEssentials = "Data Essentials"
    case notifications = "Notifications"
    case pdfFiles = "PDF Files"
    case uiComponents = "UI Components"
    case charts = "Charts"
    case augmentedReality = "Augmented Reality"
    case gestures = "Gestures"
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
