//
//  ChartsModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 13/08/23.
//

import Foundation

enum VehicleTypes: String {
    case suv
    case sedan
    case hatch
}

struct Vehicle {
    var type: VehicleTypes
    var model: String
}

struct VehicleSales: Identifiable {
    var id = UUID()
    var month: String
    var count: Int
    var type: VehicleTypes
}

struct YearStocks: Identifiable {
    var id = UUID()
    var month: String
    var price: Double
}
