//
//  SwiftUILearningsUITests.swift
//  SwiftUILearningsUITests
//
//  Created by Saurabh Verma on 02/03/23.
//  Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

import XCTest
import SwiftUILearnings

final class SwiftUILearningsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppLaunch() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLandingPageTitle() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.navigationBars["Learnings"].staticTexts["Learnings"].exists)
    }
    
    func testAvailableOptions() throws {
        let app = XCUIApplication()
        app.launch()
        
        let geometryReader = app.collectionViews.buttons["Geometry Reader"]
        XCTAssertTrue(geometryReader.waitForExistence(timeout: 2))
        
        XCTAssertTrue(app.collectionViews.buttons["Geometry Reader"].exists)
        XCTAssertTrue(app.collectionViews.buttons["Web Content Technologies"].exists)
        XCTAssertTrue(app.collectionViews.buttons["Data Essentials"].exists)
        XCTAssertTrue(app.collectionViews.buttons["Notifications"].exists)
        XCTAssertTrue(app.collectionViews.buttons["PDF Files"].exists)
        XCTAssertTrue(app.collectionViews.buttons["UI Components"].exists)
    }
    
    func test_SelectOption_GeometryReader() {
        let app = XCUIApplication()
        app.launch()
        let geometryReader = app.collectionViews.buttons["Geometry Reader"]
        XCTAssertTrue(geometryReader.exists)
        geometryReader.tap()
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
