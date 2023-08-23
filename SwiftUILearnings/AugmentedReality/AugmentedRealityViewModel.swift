//
//  AugmentedRealityViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 23/08/23.
//

import Foundation
import ARKit

class AugmentedRealityViewModel: NSObject,
                                 ARSCNViewDelegate,
                                 ObservableObject {
    
    private var arSCNView: ARSCNView?
    
    func setARSCNView(_ view: ARSCNView) {
        arSCNView = view
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.position = SCNVector3(0, 0, -0.2)
        
        arSCNView?.delegate = self
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        arSCNView?.scene = scene
    }
    
}
