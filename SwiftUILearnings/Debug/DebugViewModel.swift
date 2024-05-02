//
//  DebugViewModel.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/05/24.
//

import Foundation

class DebugViewModel: ObservableObject {
    var crash: Int?
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

extension DebugViewModel {
    /// Use this function to crash app which will call multiple functions finally creating a crash. Point to note is
    /// the difference in the Xcode debugger at which point it stops when one uses `Swift Error Breakpoint`
    /// vs when one hasn't used it.
    /// When `Swift Error Breakpoint` is added then debugger stops right in the line at function
    /// `errorThrowingFuntion()` resulting in crash. Whereas when it's not used then the debugger stops
    /// at the `crashWithExceptionInnerFunction_d()` function.
    ///
    /// `Swift Error Breakpoint`
    /// When crashed with `Swift Error Breakpoint` enabled one sees following call in the stack trace
    /// right after the `errorThrowingFuntion()`
    /// libswiftCore.dylib`swift_willThrow:
    ///
    /// Without Swift Error Breakpoint
    /// When Swift Error Breakpoint isn't used then one sees in stack trace `crashWithExceptionInnerFunction_d()`
    /// followed by `swift_unexpectedError`
    func crashForcedUnwrap() {
        _ = crash!
    }
}

extension DebugViewModel {
    enum DebugError: Error {
        case crashError
    }
    
    func crashWithException() {
        crashWithExceptionInnerFunction_a()
    }
    
    func crashWithExceptionInnerFunction_a() {
        crashWithExceptionInnerFunction_b()
    }
    
    func crashWithExceptionInnerFunction_b() {
        crashWithExceptionInnerFunction_c()
    }
    
    func crashWithExceptionInnerFunction_c() {
        crashWithExceptionInnerFunction_d()
    }
    
    func crashWithExceptionInnerFunction_d() {
        try! errorThrowingFuntion()
    }
    
    func errorThrowingFuntion() throws {
        throw DebugError.crashError
    }
}
