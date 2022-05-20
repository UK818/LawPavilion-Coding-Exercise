//
//  collectionViewUITests.swift
//  LawPavilion Coding Exercise UITests
//
//  Created by mac on 20/05/2022.
//

import XCTest

class UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchPerformance() throws {
		        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
					
			let app = XCUIApplication()
			let searchButton = app.buttons["Search"]
			searchButton.tap()
			XCTAssertTrue(searchButton.exists, "button does not exist")
				
		}
    }
}
