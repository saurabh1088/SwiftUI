//
//  NetworkStatusView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 17/10/25.
//

import SwiftUI

struct NetworkStatusView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    var body: some View {
        VStack(spacing: 25) {
            
            Image(systemName: networkMonitor.isConnected ? "globe.americas.fill" : "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(networkMonitor.isConnected ? .mint : .orange)
                .symbolRenderingMode(.multicolor)
            
            Text(networkMonitor.isConnected ? "Connection Satisfied" : "Offline or Restricted")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "network")
                        .foregroundColor(.mint)
                    Text("Connection Type:")
                        .fontWeight(.medium)
                    Spacer()
                    Text(networkMonitor.connectionType.description)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: networkMonitor.isExpensive ? "chart.bar.doc.horizontal.fill" : "gauge.with.dots.needle.bottom.fill")
                        .foregroundColor(networkMonitor.isExpensive ? .red : .green)
                    Text("Data Usage:")
                        .fontWeight(.medium)
                    Spacer()
                    Text(networkMonitor.isExpensive ? "Expensive (e.g., Cellular)" : "Normal (Wi-Fi)")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
            
            Spacer()
            
            if !networkMonitor.isConnected {
                Text("Please check your device settings and ensure you have an active network connection to use all app features.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(30)
    }
}


#Preview {
    NetworkStatusView()
}
