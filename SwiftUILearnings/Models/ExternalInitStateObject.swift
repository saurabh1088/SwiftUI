//
//
// ExternalInitStateObject.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 19/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation
import SwiftUI
import OSLog

class ExternalInitStateObject: ObservableObject {
    @Published var themeColor: Color
    
    init(themeColor: Color) {
        Logger.viewModel.info("Calling init for ExternalInitStateObject")
        self.themeColor = themeColor
    }
}
