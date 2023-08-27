//
//  AugmentedRealityContainerView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 20/08/23.
//

import Foundation
import SwiftUI
import RealityKit

// TODO: Check this one https://www.gfrigerio.com/arkit-in-a-swiftui-app/
struct AugmentedRealityContainerView: UIViewRepresentable {
    typealias UIViewType = ARView
    
    let arSCNDelegate: AugmentedRealityViewModel
    
    func makeUIView(context: Context) -> ARView {
        let augmentedRealitySceneView = ARView(frame: .zero)
        arSCNDelegate.setARSCNView(augmentedRealitySceneView)
        return augmentedRealitySceneView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) { }
}
