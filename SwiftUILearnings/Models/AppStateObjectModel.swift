//
//
// AppStateObjectModel.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 16/03/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation
import SwiftUI

class AppStateObjectModel: ObservableObject {
    @Published var navigationPath = NavigationPath()
}
