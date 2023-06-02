//
//
// SelectableListModel.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 02/06/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import Foundation

struct SelectableListModel: Identifiable, Hashable {
    let id = UUID()
    let selectedIndex: Int
}
