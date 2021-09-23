//
//  Amazing_meteorUITests.swift
//  Amazing meteorUITests
//
//  Created by venus on 9/20/21.
//

import XCTest

class Amazing_meteorUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMeteorsTapButton() throws {
        let tapBtn = app.tabBars
        tapBtn.buttons["Meteors"].tap()
    }
    
    func testFavoritesTapButton() throws {
        let tapBtn = app.tabBars
        tapBtn.buttons["Favorites"].tap()
    }
    
    func testByDateSegement() throws {
        let picker = app.descendants(matching: .any)["By Date"]
        picker.tap()
    }
    
    func testBySizeSegment() throws {
        let picker = app.descendants(matching: .any)["By Size"]
        picker.tap()
    }
    
    func testMeteorList() throws {
        //app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        let list = app.tables["MeteorList"]
        list.cells.element(boundBy: 0).tap()
    }
    
    func testFavoritesList() throws {
        let tapBtn = app.tabBars
        tapBtn.buttons["Favorites"].tap()
        let list = app.tables["FavoritesList"]
        list.cells.element(boundBy: 0).tap()
    }
    
    func testMapBackBtn() throws {
        let list = app.tables["MeteorList"]
        list.cells.element(boundBy: 0).tap()
        let backbtn = app.buttons["MapBackBtn"]
        backbtn.tap()
    }
    
    func testFavoritesBtn() throws {
        let list = app.tables["MeteorList"]
        list.cells.element(boundBy: 0).tap()
        let favbtn = app.buttons["FavoritesBtn"]
        favbtn.tap()
    }
    
    func testAddandRemoveFavorites() throws {
        //tap "Abbe" in the Meteorlist
        let meteorlist = app.descendants(matching: .any)["Abee"]
        XCTAssertNotNil(meteorlist.value)
        meteorlist.tap()
        //tap Favorites Button to add meteor
        let favbtn = app.buttons["FavoritesBtn"]
        favbtn.tap()
        //return to Meteorlist
        let backbtn = app.buttons["MapBackBtn"]
        backbtn.tap()
        // tap Favorite tap button
        let tapBtn = app.tabBars
        tapBtn.buttons["Favorites"].tap()
        //check to exist "Abee" element and tap "Abee"
        let favlist = app.descendants(matching: .any)["Abee"]
        XCTAssertNotNil(favlist.value)
        favlist.tap()
        //tap Favorites Button to remove meteor
        let favbtn1 = app.buttons["FavoritesBtn"]
        favbtn1.tap()
        //return to Favoriteslist
        let backbtn1 = app.buttons["MapBackBtn"]
        backbtn1.tap()
        //check to remove "Abee" element
        XCTAssertNil(app.descendants(matching: .any)["Abee"].value)
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
