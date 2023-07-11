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
        
        let geometryReaderOption = app.collectionViews.buttons["Geometry Reader"]
        XCTAssertTrue(geometryReaderOption.exists)
        geometryReaderOption.tap()
        
        let backButtonToLearningsView = app.navigationBars["Geometry Reader"].buttons["Learnings"]
        XCTAssertTrue(backButtonToLearningsView.exists)
        backButtonToLearningsView.tap()
    }
    
    func test_SelectOption_WebContentTechnologies() {
        let app = XCUIApplication()
        app.launch()
        
        let webContentTechnologiesOption = app.collectionViews.buttons["Web Content Technologies"]
        XCTAssertTrue(webContentTechnologiesOption.exists)
        webContentTechnologiesOption.tap()
        
        let backButtonToLearningsView = app.navigationBars["Web Content Technologies"].buttons["Learnings"]
        XCTAssertTrue(backButtonToLearningsView.exists)
        backButtonToLearningsView.tap()
    }
    
    func test_SelectOption_DataEssentials() {
        let app = XCUIApplication()
        app.launch()
        
        let dataEssentialsOption = app.collectionViews.buttons["Data Essentials"]
        XCTAssertTrue(dataEssentialsOption.exists)
        dataEssentialsOption.tap()
        
        let backButtonToLearningsView = app.navigationBars["Data Essentials"].buttons["Learnings"]
        XCTAssertTrue(backButtonToLearningsView.exists)
        backButtonToLearningsView.tap()
    }
    
    func test_SelectOption_Notifications() {
        let app = XCUIApplication()
        app.launch()
        
        let notificationsOption = app.collectionViews.buttons["Notifications"]
        XCTAssertTrue(notificationsOption.exists)
        notificationsOption.tap()
        
        let backButtonToLearningsView = app.navigationBars["Notifications"].buttons["Learnings"]
        XCTAssertTrue(backButtonToLearningsView.exists)
        backButtonToLearningsView.tap()
    }
    
    func test_SelectOption_PDFFiles() {
        let app = XCUIApplication()
        app.launch()
        
        let pdfFilesOption = app.collectionViews.buttons["PDF Files"]
        XCTAssertTrue(pdfFilesOption.exists)
        pdfFilesOption.tap()
        
        let backButtonToLearningsView = app.navigationBars["PDF Files"].buttons["Learnings"]
        XCTAssertTrue(backButtonToLearningsView.exists)
        backButtonToLearningsView.tap()
    }
    
    func test_SelectOption_UIComponents() {
        let app = XCUIApplication()
        app.launch()
        
        let uiComponentsOption = app.collectionViews.buttons["UI Components"]
        XCTAssertTrue(uiComponentsOption.exists)
        uiComponentsOption.tap()
        
        let backButtonToLearningsView = app.navigationBars["UI Components"].buttons["Learnings"]
        XCTAssertTrue(backButtonToLearningsView.exists)
        backButtonToLearningsView.tap()
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
