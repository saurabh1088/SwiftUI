//
//  DebugViewModelTests.swift
//  SwiftUILearningsTests
//
//  Created by Saurabh Verma on 25/05/24.
//

import XCTest
@testable import SwiftUILearnings

final class DebugViewModelTests: XCTestCase {
    
    func test_defaultDebugViewModel() {
        let sut = DebugViewModel()
        
        XCTAssertNil(sut.crash)
        XCTAssertNil(sut.debugModel)
        XCTAssertNil(sut.someDebuggable)
        XCTAssertNil(sut.someDebugModelWithNoCustomStringConvertible)
    }
    
    func test_createDebugModel() {
        let sut = DebugViewModel()
        sut.createDebugModel()
        
        XCTAssertNotNil(sut.debugModel)
        XCTAssertEqual(1, sut.debugModel?.id)
        XCTAssertEqual("This is debug model of type DebugModel", sut.debugModel?.value)
    }
    
    func test_createSomeDebuggable() {
        let sut = DebugViewModel()
        sut.createSomeDebuggable()
        
        XCTAssertNotNil(sut.someDebuggable)
        XCTAssertEqual(2, sut.someDebuggable?.id)
        XCTAssertEqual("This is some debug model conforming to Debuggable", sut.someDebuggable?.value)
    }
    
    func test_createSomeDebugModelWithNoCustomStringConvertible() {
        let sut = DebugViewModel()
        sut.createSomeDebugModelWithNoCustomStringConvertible()
        
        XCTAssertNotNil(sut.createSomeDebugModelWithNoCustomStringConvertible)
        XCTAssertEqual(1, sut.someDebugModelWithNoCustomStringConvertible?.id)
        XCTAssertEqual("value", sut.someDebugModelWithNoCustomStringConvertible?.value)
        XCTAssertEqual("debug", sut.someDebugModelWithNoCustomStringConvertible?.level)
        XCTAssertEqual("crash", sut.someDebugModelWithNoCustomStringConvertible?.issue)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
