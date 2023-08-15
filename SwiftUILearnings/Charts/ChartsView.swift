//
//  ChartsView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 13/08/23.
//

import SwiftUI
import Charts

/**
 Swift Charts as imported above is a new framework provided from Apple which provides API to visualize data in
 declarative way using SwiftUI.
 A chart is a very effective way to communicate and represent some large amount of data.
 
 To create a chart, one needs to have some data which is required to be conforming to `Identifiable` and then
 one needs to initialize a `Chart` view.
 
 `Chart`
 Chart is a SwiftUI view which displays a chart.
 
 - Informative
 - Accessible
 - Delightful
 
 Swift Carts calls the visual elements "Marks" which represent data for example the bar in a bar graph.
 */

// TODO: Watch https://developer.apple.com/videos/play/wwdc2022/10136/
// TODO: Watch https://developer.apple.com/videos/play/wwdc2022/110340
// TODO: Watch https://developer.apple.com/videos/play/wwdc2022/110342
// TODO: Watch https://developer.apple.com/videos/play/wwdc2022/10137
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
}

#Preview {
    ChartsView()
}

// MARK: Extension for line charts
extension ChartsView {
    // If ForEach is tha only content given to Chart, then one can omit ForEach
    // and put data directly in the Chart initializer.
    @ViewBuilder
    private var lineChartView: some View {
        VStack {
            Chart(chartsViewModel.companyStocks, id: \.id, content: { stock in
                LineMark(
                    x: .value("Month", stock.month),
                    y: .value("Price", stock.price)
                )
            })
        }
        .padding([.top, .bottom], 20)
    }
    
    @ViewBuilder
    private var lineChartUsingForEachView: some View {
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
}

// MARK: Extension for bar charts
extension ChartsView {
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
