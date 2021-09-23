//
//  GeoLocationTest.swift
//  Amazing meteorTests
//
//  Created by venus on 9/23/21.
//

import XCTest
@testable import Amazing_meteor

class GeoLocationTest: XCTestCase {
    
    private var geolocation: [GeoLocation]!
    
    let jsonData = """
        [{"type":"Point","coordinates":[6.08333,50.775]},
        {"type":"Point","coordinates":[10.23333,56.18333]}]
        """.data(using: .utf8)
    
    override func setUpWithError() throws {
        geolocation = [GeoLocation]()
    }

    override func tearDownWithError() throws {
        geolocation = nil
    }
    
    func testDecodable() throws {
        let decode = try JSONDecoder().decode([GeoLocation].self, from: self.jsonData!)
        XCTAssertEqual(decode.count, 2)
        XCTAssertEqual(decode[0].type, "Point")
        XCTAssertEqual(decode[0].coordinates.count, 2)
        XCTAssertEqual(decode[0].coordinates[0], 6.08333)
        XCTAssertEqual(decode[0].coordinates[1], 50.775)
    }
    
    func testEncodable() throws {
        let decode = try JSONDecoder().decode([GeoLocation].self, from: self.jsonData!)
        let encoded = try? JSONEncoder().encode(decode)
        XCTAssertNotNil(encoded)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
