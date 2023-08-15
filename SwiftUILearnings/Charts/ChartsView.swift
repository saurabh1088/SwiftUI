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
        VStack(spacing: 20) {
            Button("Line Chart") {
                chartsViewModel.showLineChartsView.toggle()
            }
            .sheet(isPresented: $chartsViewModel.showLineChartsView) {
                lineChartView
            }
            
            Button("Bar Chart") {
                chartsViewModel.showBarChartsView.toggle()
            }
            .sheet(isPresented: $chartsViewModel.showBarChartsView) {
                barChartView
            }
        }
    }
    
    @ViewBuilder
    private var lineChartView: some View {
        VStack {
            Chart {
                ForEach(chartsViewModel.companyStocks) { data in
                    LineMark(
                        x: .value("Month", data.month),
                        y: .value("Price", data.price)
                    )
                }
            }
        }
        .padding([.top, .bottom], 20)
    }
    
    @ViewBuilder
    private var barChartView: some View {
        VStack {
            Chart {
                ForEach(chartsViewModel.vehicleSalesData) { data in
                    BarMark(
                        x: .value("Vehicle Type", data.type.rawValue),
                        y: .value("Sales", data.count)
                    )
                }
            }
        }
        .padding([.top, .bottom], 20)
    }
}

#Preview {
    ChartsView()
}
