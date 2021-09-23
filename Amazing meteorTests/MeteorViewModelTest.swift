//
//  MeteorViewModelTest.swift
//  Amazing meteorTests
//
//  Created by venus on 9/22/21.
//

import XCTest
@testable import Amazing_meteor

class MeteorViewModelTest: XCTestCase {

    private var meteorViewModel: MeteorViewModel!
    override func setUpWithError() throws {
        meteorViewModel = MeteorViewModel()
    }

    override func tearDownWithError() throws {
        meteorViewModel = nil
    }

    func testmeteorLandingAPI() throws {
        _ = meteorViewModel.objectWillChange.sink{
            self.meteorViewModel.meteorLandingsAPI()
            XCTAssertNotNil(self.meteorViewModel.meteors)
            XCTAssertNotEqual(self.meteorViewModel.meteors.count, 0)
            print("count:\(self.meteorViewModel.meteors.count)")
            for meteor in self.meteorViewModel.meteors {
                XCTAssertNotNil(meteor.id)
                XCTAssertNotNil(meteor.name)
                XCTAssertNotNil(meteor.nametype)
                XCTAssertNotNil(meteor.year)
                XCTAssertNotNil(meteor.recclass)
                XCTAssertNotNil(meteor.mass)
                XCTAssertNotNil(meteor.reclon)
                XCTAssertNotNil(meteor.reclat)
                XCTAssertNotNil(meteor.geoLocation)
                XCTAssertNotNil(meteor.geoLocation?.type)
                XCTAssertNotNil(meteor.geoLocation?.coordinates)
                XCTAssertNotEqual(meteor.geoLocation?.coordinates.count, 0)
            }
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
