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

class AugmentedRealityViewModel: ObservableObject {
    
    private var arView: ARView?
    private var streams = [Combine.AnyCancellable]()
    
    func pauseSession() {
        arView?.session.pause()
    }
    
    func setARView(_ view: ARView) {
        arView = view
        arView?.session.run(worldTrackingConfig())

        Plant.loadSceneAsync { result in
            do {
                print("Loaded plant scene")
                let plantScene = try result.get()
                self.arView?.scene.anchors.append(plantScene)
            } catch {
                print("Failed to load plant scene")
            }
        }
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        arView?.addGestureRecognizer(tapGesture)
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        guard let arView = arView else { return }
        let location = sender.location(in: arView)
        let result = arView.hitTest(location, with: nil)
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

// MARK: Extension AugmentedRealityViewModel : World tracking configuration
extension AugmentedRealityViewModel {
    private func worldTrackingConfig() -> ARWorldTrackingConfiguration {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        return configuration
    }
}

extension AugmentedRealityViewModel {
    private func addPerspectiveCamera() {
        let camera = PerspectiveCamera()
        let cameraAnchor = AnchorEntity(world: [0, 0.2, 0.5])
        cameraAnchor.addChild(camera)
        arView?.scene.addAnchor(cameraAnchor)
    }
}
