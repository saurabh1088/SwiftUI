//
//  DebugViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/05/24.
//

import Foundation

class DebugViewModel: ObservableObject {
    var debugModel: DebugModel?
    var someDebugable: Debugable?
    
    func createDebugModel() {
        let debugModelId = 1
        let debugModelValue = "This is debug model of type DebugModel"
        let localDebugModel = DebugModel(id: debugModelId,
                                    value: debugModelValue)
        debugModel = localDebugModel
    }
    
    func createSomeDebugable() {
        let debugModelId = 2
        let debugModelValue = "This is some debug model conforming to Debugable"
        let localSomeDebugable = DebugModel(id: debugModelId,
                                    value: debugModelValue)
        someDebugable = localSomeDebugable
    }
}
