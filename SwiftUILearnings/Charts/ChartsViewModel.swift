//
//  ChartsViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 13/08/23.
//

import Foundation

class ChartsViewModel: ObservableObject {
    var vehicleSalesData: [VehicleSales] = [
        .init(month: "August", count: 20, type: .hatch),
        .init(month: "August", count: 10, type: .suv),
        .init(month: "August", count: 2, type: .sedan)
    ]
}
