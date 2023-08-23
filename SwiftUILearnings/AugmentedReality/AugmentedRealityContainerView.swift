//
//  AugmentedRealityContainerView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 20/08/23.
//

import Foundation
import SwiftUI
import ARKit

// TODO: Check this one https://www.gfrigerio.com/arkit-in-a-swiftui-app/
struct AugmentedRealityContainerView: UIViewRepresentable {
    typealias UIViewType = ARSCNView
    
    let arSCNDelegate: AugmentedRealityViewModel
    
    func makeUIView(context: Context) -> ARSCNView {
        let augmentedRealitySceneView = ARSCNView(frame: .zero)
        arSCNDelegate.setARSCNView(augmentedRealitySceneView)
        return augmentedRealitySceneView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) { }
}
