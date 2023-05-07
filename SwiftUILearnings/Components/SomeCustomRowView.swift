//
//
// SomeCustomRowView.swift
// SwiftUILearnings
//
// Created by Saurabh Verma on 07/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import SwiftUI

struct SomeCustomRowView: View {
    var value: Int
    init(value: Int) {
        self.value = value
        print("Initialised SomeCustomRowView with value : \(value)")
    }
    var body: some View {
        Text("Row \(value)")
    }
}

struct SomeCustomRowView_Previews: PreviewProvider {
    static var previews: some View {
        SomeCustomRowView(value: 2)
    }
}
