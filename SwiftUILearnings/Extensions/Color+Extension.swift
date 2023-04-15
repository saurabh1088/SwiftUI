//
//
// Color+Extension.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 15/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation
import SwiftUI

extension Color {
    static let primaryRed = Color("primaryRed")
    static let primaryGreen = Color("primaryGreen")
    static let primaryOrange = Color("primaryOrange")
    static let primaryVeryDarkBlue = Color("primaryVeryDarkBlue")
    static let primaryYellow = Color("primaryYellow")
    
    static let randomPrimary = [primaryRed,
                                primaryGreen,
                                primaryOrange,
                                primaryVeryDarkBlue,
                                primaryYellow].randomElement()
}
