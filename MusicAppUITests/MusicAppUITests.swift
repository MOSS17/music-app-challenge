//
//  MusicAppUITests.swift
//  MusicAppUITests
//
//  Created by Miguel Sandoval on 29/07/24.
//

import XCTest

final class MusicAppUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testNavigationToDetailsAndBack() throws {
        let scrollViewItem = app.scrollViews.otherElements.staticTexts["Olivia Rodrigo"]
        XCTAssertTrue(scrollViewItem.exists)
        scrollViewItem.tap()
        
        let backButton = app.navigationBars.buttons["Back"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
    }
    
    func testScrollAndNavigation() throws {
        let scrollViewItem = app.scrollViews.otherElements.staticTexts["BTS"]
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        let image = elementsQuery.buttons["Shakira, Colombian Pop, Dance Pop, Latin Pop"].children(matching: .image).element
        image.swipeUp()
        image.swipeUp()
        scrollViewItem.tap()
        
        let backButton = app.navigationBars.buttons["Back"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
    }
    
    func testNavigationToRelatedArtist() throws {
        let scrollViewsQuery = XCUIApplication().scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let scrollViewItem = elementsQuery.otherElements.staticTexts["Post Malone"]
        XCTAssertTrue(scrollViewItem.exists)
        scrollViewItem.tap()
        
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Post Malone").element.swipeUp()
        let relatedArtist = elementsQuery.scrollViews.otherElements.buttons["Juice WRLD"]
        XCTAssertTrue(relatedArtist.exists)
        relatedArtist.tap()
    }
}
