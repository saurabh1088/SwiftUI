//
//  ChartsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 13/08/23.
//

import SwiftUI
import Charts

struct ChartsView: View {
    @StateObject var chartsViewModel = ChartsViewModel()
    
    var body: some View {
        lineChartView
    }
    
    @ViewBuilder
    private var lineChartView: some View {
        Chart {
            ForEach(chartsViewModel.companyStocks) { data in
                LineMark(
                    x: .value("Month", data.month),
                    y: .value("Price", data.price)
                )
            }
        }
    }
    
    @ViewBuilder
    private var barChartView: some View {
        Chart {
            ForEach(chartsViewModel.vehicleSalesData) { data in
                BarMark(
                    x: .value("Vehicle Type", data.type.rawValue),
                    y: .value("Sales", data.count)
                )
            }
        }
    }
}

#Preview {
    ChartsView()
}
