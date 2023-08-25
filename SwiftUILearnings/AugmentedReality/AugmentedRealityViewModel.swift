//
//  AugmentedRealityViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 23/08/23.
//

import ARKit
import Combine
import Foundation
import RealityKit

class AugmentedRealityViewModel: NSObject,
                                 ARSCNViewDelegate,
                                 ObservableObject {
    
    private var arSCNView: ARSCNView?
    private var streams = [Combine.AnyCancellable]()
    
    func setARSCNView(_ view: ARSCNView) {
        arSCNView = view
        
        /// SCNBox here defines a box as name suggests, more precisely, it defines a six sided polyhedron
        /// as mentioned in Apple documentation.
        /// width, height and length are self explanatory.
        ///
        /// `chamferRadius`
        /// - chamferRadius provides rounded "edges and corners" to the box.
        /// - Maximum corner radius is half the box’s smallest dimension. This is reason, below value is in
        /// range of 0.0s. If this value is more than half of box's smallest dimension messes up the shape and
        /// it appears more like a sphere/cylinder etc.
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.position = SCNVector3(0, 0, -0.2)
        
        arSCNView?.delegate = self
        let scene = SCNScene(named: "sampleScene")
        scene?.rootNode.addChildNode(boxNode)
        arSCNView?.scene = scene ?? SCNScene()
        
        arSCNView?.session.run(worldTrackingConfig())
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        arSCNView?.addGestureRecognizer(tapGesture)
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        guard let arSCNView = arSCNView else { return }
        let location = sender.location(in: arSCNView)
        let result = arSCNView.hitTest(location, options: nil)
        let node = result.first?.node
    }
    
    private func worldTrackingConfig() -> ARWorldTrackingConfiguration {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        return configuration
    }
    
    // TODO: Debug: Not working
    func createRealityURL(filename: String,
                          fileExtension: String,
                          sceneName:String) -> URL? {
        // Create a URL that points to the specified Reality file.
        guard let realityFileURL = Bundle.main.url(forResource: filename,
                                                   withExtension: fileExtension) else {
            print("Error finding Reality file \(filename).\(fileExtension)")
            return nil
        }

        // Append the scene name to the URL to point to
        // a single scene within the file.
        let realityFileSceneURL = realityFileURL.appendingPathComponent(sceneName,
                                                                        isDirectory: false)
        return realityFileSceneURL
    }
    
    // TODO: Debug : Not working
    func loadRealityComposerSceneAsync (filename: String,
                                        fileExtension: String,
                                        sceneName: String,
                                        completion: @escaping (Swift.Result<(Entity & HasAnchoring)?, Swift.Error>) -> Void) {
        guard let realityFileSceneURL = createRealityURL(filename: filename, fileExtension: fileExtension, sceneName: sceneName) else {
            print("Error: Unable to find specified file in application bundle")
            return
        }

        let loadRequest = Entity.loadAnchorAsync(contentsOf: realityFileSceneURL)
        let cancellable = loadRequest.sink(receiveCompletion: { (loadCompletion) in
            if case let .failure(error) = loadCompletion {
                completion(.failure(error))
            }
        }, receiveValue: { (entity) in
            completion(.success(entity))
        })
        cancellable.store(in: &streams)
    }
}
