//
//  AugmentedRealityView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 23/08/23.
//

import SwiftUI

struct AugmentedRealityView: View {
    @StateObject private var arViewModel = AugmentedRealityViewModel()
    
    var body: some View {
        AugmentedRealityContainerView(arViewModel: arViewModel)
            .onDisappear {
                arViewModel.pauseSession()
            }
    }
}

struct AugmentedRealityView_Previews: PreviewProvider {
    static var previews: some View {
        AugmentedRealityView()
    }
}
