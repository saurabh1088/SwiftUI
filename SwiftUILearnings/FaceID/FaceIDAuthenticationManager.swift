//
//  FaceIDAuthenticationManager.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 17/11/24.
//

import Foundation
import LocalAuthentication

protocol FaceIDAuthenticationManagerProtocol {
    func authenticate(completion: @escaping (Swift.Result<Bool, FaceIDAuthenticationError>) -> Void)
}

enum FaceIDAuthenticationError: Error {
    case failed
    case cancelled
}

class FaceIDAuthenticationManager: FaceIDAuthenticationManagerProtocol {

    func authenticate(completion: @escaping (Swift.Result<Bool, FaceIDAuthenticationError>) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            if context.biometryType == .faceID {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with FaceID") { success, error in
                    if success {
                        completion(.success(true))
                    } else if let error {
                        completion(.failure(.failed))
                    } else {
                        completion(.failure(.cancelled))
                    }
                }
            }
        }
    }
}
