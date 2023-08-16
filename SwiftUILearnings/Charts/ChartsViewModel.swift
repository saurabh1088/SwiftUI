//
//  ChartsViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 13/08/23.
//

import Foundation

class ChartsViewModel: ObservableObject {
    @Published var showPointChartsView: Bool = false
    @Published var showLineChartsView: Bool = false
    @Published var showBarChartsView: Bool = false
    @Published var showRuleMark: Bool = false
    
    var vehicleSalesData: [VehicleSales] = [
        .init(month: "August", count: 20, type: .hatch),
        .init(month: "August", count: 10, type: .suv),
        .init(month: "August", count: 2, type: .sedan)
    ]
    
    var companyStocks: [YearStocks] = [
        .init(month: "Jan", price: 101.23),
        .init(month: "Feb", price: 113.04),
        .init(month: "Mar", price: 121.39),
        .init(month: "Apr", price: 128.34),
        .init(month: "May", price: 127.20),
        .init(month: "Jun", price: 90.14),
        .init(month: "Jul", price: 150.33),
        .init(month: "Aug", price: 160.11),
        .init(month: "Sep", price: 160.11),
        .init(month: "Oct", price: 160.11),
        .init(month: "Nov", price: 160.11),
        .init(month: "Dec", price: 160.11),
    ]
}
