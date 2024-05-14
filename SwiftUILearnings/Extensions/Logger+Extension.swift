//
//
// Logger+Extension.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 02/07/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation
import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!
}

extension Logger {
    static let appCycle = Logger(subsystem: subsystem, category: "appCycle")
    static let augmentedReality = Logger(subsystem: subsystem, category: "augmentedReality")
    static let eventKit = Logger(subsystem: subsystem, category: "eventKit")
    static let navigation = Logger(subsystem: subsystem, category: "navigation")
    static let notifications = Logger(subsystem: subsystem, category: "notifications")
    static let speech = Logger(subsystem: subsystem, category: "speech")
    static let view = Logger(subsystem: subsystem, category: "view")
    static let viewModel = Logger(subsystem: subsystem, category: "viewModel")
}
