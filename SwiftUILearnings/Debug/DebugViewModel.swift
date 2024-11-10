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
    var someDebuggable: Debuggable?
    var someDebugModelWithNoCustomStringConvertible: DebugModelWithNoCustomStringConvertible?
    var leakCreatingClosure: (() -> Void)?
    var leakCreatingClosureProperty: String?
    
    func createDebugModel() {
        let debugModelId = 1
        let debugModelValue = "This is debug model of type DebugModel"
        let localDebugModel = DebugModel(id: debugModelId,
                                         value: debugModelValue)
        debugModel = localDebugModel
    }
    
    func createSomeDebuggable() {
        let debugModelId = 2
        let debugModelValue = "This is some debug model conforming to Debuggable"
        let localSomeDebuggable = DebugModel(id: debugModelId,
                                             value: debugModelValue)
        someDebuggable = localSomeDebuggable
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

extension DebugViewModel {
    /// Having a label for queue is great way to debug. Once app crashes when crashInBackgroundThread()
    /// gets called, one can see in the Xcode debugger that the thread which crashed is labeled as below.
    /// It's great way to identify if crash is happening in any of the queue being created and managed in the app
    /// itself. Then one can identify the tasks performed on the queue leading to possibly root cause.
    func crashInBackgroundThread() {
        let queueIdentifier = "com.apple.saurabh.crash-in-background-thread.serial-queue"
        let queue = DispatchQueue(label: queueIdentifier,
                                  qos: .background)
        queue.async {
            _ = self.crash!
        }
    }
}

extension DebugViewModel {
    
    func createSomeDebugModelWithNoCustomStringConvertible() {
        let model = DebugModelWithNoCustomStringConvertible(id: 1,
                                                            value: "value",
                                                            level: "debug",
                                                            issue: "crash")
        someDebugModelWithNoCustomStringConvertible = model
    }
}

extension DebugViewModel {
    
    /// Creates memory leak to observe in memory graph debugger and in Instruments leaks.
    func createMemoryLeak() {
        let objectA = ObjectA(objectB: nil)
        let objectB = ObjectB(objectA: nil)
        
        objectA.objectB = objectB
        objectB.objectA = objectA
        
        // This causes memory leak as even when one moves back from DebugView in
        // Xcode's memory map one can see DebugViewModel still lying around.
        leakCreatingClosure = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.leakCreatingClosureProperty = "leak"
            }
        }
    }
    
    private class ObjectA {
        var objectB: ObjectB?
        
        init(objectB: ObjectB?) {
            self.objectB = objectB
        }
    }
    
    private class ObjectB {
        var objectA: ObjectA?
        
        init(objectA: ObjectA?) {
            self.objectA = objectA
        }
    }
}
