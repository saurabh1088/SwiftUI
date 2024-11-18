//
//  FaceIDLearningViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 18/11/24.
//

import Foundation

class FaceIDLearningViewModel: ObservableObject {
    let faceIdAuthManager: FaceIDAuthenticationManagerProtocol
    @Published var faceIdAuthStatus: Bool = false
    
    init(faceIdAuthManager: FaceIDAuthenticationManagerProtocol) {
        self.faceIdAuthManager = faceIdAuthManager
    }
    
    func authenticate() {
        faceIdAuthManager.authenticate { status in
            switch status {
                case .success:
                self.faceIdAuthStatus = true
            case .failure:
                self.faceIdAuthStatus = false
            }
        }
    }
}
