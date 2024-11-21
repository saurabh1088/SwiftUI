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
        
        /// Code suggested while recording doesn't works. If UI is inspected using Accessibility inspector then
        /// the UI behind sheet is shown in inspector having label as "dismiss popup". This is what used here
        /// to dismiss the sheet.
        /// firstMatch is used as there are multiple elements with "dismiss popup" label.
        let dissmissPopoverButton = app.otherElements["dismiss popup"].firstMatch
        XCTAssertTrue(dissmissPopoverButton.waitForExistence(timeout: 2))
        dissmissPopoverButton.tap()
        
        let animatedStaticText = app.staticTexts["🤡"]
        XCTAssertTrue(animatedStaticText.exists)
        
        let backButton = app.navigationBars.buttons["Back"]
        XCTAssertTrue(backButton.waitForExistence(timeout: 2))
        backButton.tap()
        
        let scenariosBackNavigationButton = app.navigationBars.buttons["Scenarios"]
        XCTAssertTrue(scenariosBackNavigationButton.waitForExistence(timeout: 2))
        scenariosBackNavigationButton.tap()
        
        let learningsBackNavigationButton = app.navigationBars.buttons["Learnings"]
        XCTAssertTrue(learningsBackNavigationButton.waitForExistence(timeout: 2))
        learningsBackNavigationButton.tap()
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
