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
    
    func makeUIView(context: Context) -> ARSCNView {
        let augmentedRealitySceneView = ARSCNView(frame: .zero)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.position = SCNVector3(0, 0, -0.2)
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        augmentedRealitySceneView.scene = scene
        return augmentedRealitySceneView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) { }
}
