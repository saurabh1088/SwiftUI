//
//  LearningOptionAnimationsUITests.swift
//  SwiftUILearningsUITests
//
//  Created by Saurabh Verma on 19/07/24.
//

import XCTest

final class LearningOptionAnimationsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelectSwiftUIAnimationsAnimateThenDismissSheet() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Home screen tap on animations options
        let homePageOptions = app.collectionViews
        let animationsOption = homePageOptions.buttons["Animations"]
        XCTAssertTrue(animationsOption.waitForExistence(timeout: 2))
        animationsOption.tap()
        
        // Animation options on animation home page, tap on SwiftUI option
        let animationOptions = app.collectionViews
        let swiftUIOption = animationOptions.buttons["SwiftUI"]
        XCTAssertTrue(swiftUIOption.waitForExistence(timeout: 2))
        swiftUIOption.tap()
        
        let swiftUIAnimationOptions = app.collectionViews
        let withAnimationOption = swiftUIAnimationOptions.buttons["With Animation"]
        XCTAssert(withAnimationOption.waitForExistence(timeout: 2))
        withAnimationOption.tap()
        
        let animateButton = app.buttons["Animate"]
        XCTAssert(animateButton.waitForExistence(timeout: 2))
        animateButton.tap()
        
        // Dismiss the pop-over sheet
        let popoverdismissregionElement = app.windows.children(matching: .other).element(boundBy: 1).otherElements["PopoverDismissRegion"]
        popoverdismissregionElement.tap()
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
