//
//  SFSymbolAnimationTypeTests.swift
//  SwiftUILearningsTests
//
//  Created by Saurabh Verma on 30/06/24.
//

import XCTest
import SwiftUI
@testable import SwiftUILearnings

final class SFSymbolAnimationTypeTests: XCTestCase {

    func test_SFSymbolAnimationType_allCases() {
        let allCases = [SFSymbolAnimationType.appear,
                        SFSymbolAnimationType.bounce,
                        SFSymbolAnimationType.disappear,
                        SFSymbolAnimationType.pulse,
                        SFSymbolAnimationType.replace(true),
                        SFSymbolAnimationType.scale,
                        SFSymbolAnimationType.variableColor]
        XCTAssertEqual(allCases, SFSymbolAnimationType.allCases)
    }
    
    func test_SFSymbolAnimationType_animationExampleSymbolName() {
        XCTAssertEqual("snowflake.circle.fill", SFSymbolAnimationType.appear.animationExampleSymbolName)
        XCTAssertEqual("message.badge.filled.fill", SFSymbolAnimationType.bounce.animationExampleSymbolName)
        XCTAssertEqual("snowflake.circle", SFSymbolAnimationType.disappear.animationExampleSymbolName)
        XCTAssertEqual("bonjour", SFSymbolAnimationType.pulse.animationExampleSymbolName)
        XCTAssertEqual("figure.walk", SFSymbolAnimationType.replace(true).animationExampleSymbolName)
        XCTAssertEqual("figure.run", SFSymbolAnimationType.replace(false).animationExampleSymbolName)
        XCTAssertEqual("message.badge", SFSymbolAnimationType.scale.animationExampleSymbolName)
        XCTAssertEqual("touchid", SFSymbolAnimationType.variableColor.animationExampleSymbolName)
    }
        
    func test_SFSymbolAnimationType_title() {
        XCTAssertEqual("Appear", SFSymbolAnimationType.appear.title)
        XCTAssertEqual("Bounce", SFSymbolAnimationType.bounce.title)
        XCTAssertEqual("Disappear", SFSymbolAnimationType.disappear.title)
        XCTAssertEqual("Pulse", SFSymbolAnimationType.pulse.title)
        XCTAssertEqual("Replace", SFSymbolAnimationType.replace(true).title)
        XCTAssertEqual("Replace", SFSymbolAnimationType.replace(false).title)
        XCTAssertEqual("Scale", SFSymbolAnimationType.scale.title)
        XCTAssertEqual("Variable Color", SFSymbolAnimationType.variableColor.title)
    }
    
    func test_SFSymbolAnimationType_animationExampleSymbolColor() {
        XCTAssertEqual(Color.primaryRed, SFSymbolAnimationType.appear.animationExampleSymbolColor)
        XCTAssertEqual(Color.primaryGreen, SFSymbolAnimationType.disappear.animationExampleSymbolColor)
        XCTAssertEqual(Color.primaryOrange, SFSymbolAnimationType.replace(true).animationExampleSymbolColor)
        XCTAssertEqual(Color.primaryOrange, SFSymbolAnimationType.replace(false).animationExampleSymbolColor)
        XCTAssertNil(SFSymbolAnimationType.bounce.animationExampleSymbolColor)
        XCTAssertNil(SFSymbolAnimationType.pulse.animationExampleSymbolColor)
        XCTAssertNil(SFSymbolAnimationType.scale.animationExampleSymbolColor)
        XCTAssertNil(SFSymbolAnimationType.variableColor.animationExampleSymbolColor)
    }
    
    func test_SFSymbolAnimationType_symbolSize() {
        XCTAssertEqual(100, SFSymbolAnimationType.appear.symbolSize)
        XCTAssertEqual(100, SFSymbolAnimationType.bounce.symbolSize)
        XCTAssertEqual(100, SFSymbolAnimationType.disappear.symbolSize)
        XCTAssertEqual(100, SFSymbolAnimationType.pulse.symbolSize)
        XCTAssertEqual(100, SFSymbolAnimationType.replace(true).symbolSize)
        XCTAssertEqual(100, SFSymbolAnimationType.replace(false).symbolSize)
        XCTAssertEqual(100, SFSymbolAnimationType.scale.symbolSize)
        XCTAssertEqual(100, SFSymbolAnimationType.variableColor.symbolSize)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
