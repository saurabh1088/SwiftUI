//
//  FaceIDLearningView.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 18/11/24.
//

import SwiftUI

struct FaceIDLearningView: View {
    @StateObject private var viewModel = FaceIDLearningViewModel(faceIdAuthManager: FaceIDAuthenticationManager())
    
    var body: some View {
        VStack {
            Text("Face ID Learning View")
            
            Button("Authenticate") {
                viewModel.authenticate()
            }
            
            if viewModel.faceIdAuthStatus {
                Text("😎")
                    .font(.system(size: 100))
            }
        }
    }
}

#Preview {
    FaceIDLearningView()
}
