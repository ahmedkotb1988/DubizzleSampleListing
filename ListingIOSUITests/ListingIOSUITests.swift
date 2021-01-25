//
//  ListingIOSUITests.swift
//  ListingIOSUITests
//
//  Created by Ahmed Kotb on 23/01/2021.
//  Copyright © 2021 Ahmed Kotb. All rights reserved.
//

import XCTest

class ListingIOSUITests: XCTestCase {

    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailsCell() throws {

        tapCell()
    }
    
    func testItemDetails() throws {
        
        tapCell()
        XCTAssertTrue(app.otherElements["detailsView"].exists, "Details view detected")
    }
    
    func tapCell(){
        app.tables.element(matching: .table, identifier: "ListingTableView")
        if app.tables.cells.element(boundBy: 0).waitForExistence(timeout: 200) {
            app.tables.cells.element(boundBy: 0).tap()
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
