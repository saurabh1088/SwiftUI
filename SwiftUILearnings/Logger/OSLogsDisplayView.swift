//
//  OSLogsDisplayView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 03/08/24.
//

import SwiftUI

struct OSLogsDisplayView: View {
    @ObservedObject var viewModel: OSLogViewerModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.entries, id: \.self) { value in
                    Text(value)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            }
        }
        .background(Color.black)
    }
}

#Preview {
    OSLogsDisplayView(viewModel: OSLogViewerModel())
}
