//
//  AnimationsUITests.swift
//  SwiftUILearningsUITests
//
//  Created by Saurabh Verma on 19/11/24.
//

import XCTest

final class AnimationsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SwiftUIAnimationsOptionWithAnimation() throws {
        let app = XCUIApplication()
        app.launch()
        
        let animationsOption = app.collectionViews.buttons["Animations"]
        XCTAssertTrue(animationsOption.waitForExistence(timeout: 2))
        animationsOption.tap()
        
        let animationsOptionSwiftUI = app.collectionViews.buttons["SwiftUI"]
        XCTAssertTrue(animationsOptionSwiftUI.waitForExistence(timeout: 2))
        animationsOptionSwiftUI.tap()
        
        let swiftUIAnimationsScenarioWithAnimation = app.collectionViews.buttons["With Animation"]
        XCTAssertTrue(swiftUIAnimationsScenarioWithAnimation.waitForExistence(timeout: 2))
        swiftUIAnimationsScenarioWithAnimation.tap()
        
        let animateButton = app.buttons["Animate"]
        XCTAssertTrue(animateButton.waitForExistence(timeout: 2))
        animateButton.tap()
        
        let dissmissPopoverButton = app.otherElements["dismiss popup"].firstMatch
        XCTAssertTrue(dissmissPopoverButton.waitForExistence(timeout: 2))
        dissmissPopoverButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
