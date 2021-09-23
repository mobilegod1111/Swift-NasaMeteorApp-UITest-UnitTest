//
//  MeteorModelTest.swift
//  Amazing meteorTests
//
//  Created by venus on 9/22/21.
//

import XCTest
@testable import Amazing_meteor

class MeteorModelTest: XCTestCase {

    private var meteor: [MeteorModel]!
    let JosnData = """
        [{"name":"Aachen","id":"1","nametype":"Valid","recclass":"L5","mass":"21","fall":"Fell","year":"1880-01-01T00:00:00.000","reclat":"50.775000","reclong":"6.083330","geolocation":{"type":"Point","coordinates":[6.08333,50.775]}}
        ,{"name":"Aarhus","id":"2","nametype":"Valid","recclass":"H6","mass":"720","fall":"Fell","year":"1951-01-01T00:00:00.000","reclat":"56.183330","reclong":"10.233330","geolocation":{"type":"Point","coordinates":[10.23333,56.18333]}}]
        """.data(using: .utf8)
    override func setUpWithError() throws {
        meteor = [MeteorModel]()
    }

    override func tearDownWithError() throws {
        meteor = nil
    }
    
    func testinit() throws {
        let decode = try JSONDecoder().decode([MeteorModel].self, from: self.JosnData!)
        XCTAssertEqual(decode.count, 2)
        XCTAssertEqual(decode[0].name! as String, "Aachen")
        XCTAssertEqual(decode[0].id! as String, "1")
        XCTAssertEqual(decode[0].nametype! as String, "Valid")
        XCTAssertEqual(decode[0].recclass! as String, "L5")
        XCTAssertEqual(decode[0].mass! as String, "21")
        XCTAssertEqual(decode[0].year! as String, "1880-01-01T00:00:00.000")
        XCTAssertEqual(decode[0].reclat! as String, "50.775000")
        XCTAssertEqual(decode[0].reclon! as String, "6.083330")
        XCTAssertEqual((decode[0].geoLocation?.type!)! as String, "Point")
        XCTAssertEqual(decode[0].geoLocation?.coordinates[0], 6.08333)
        XCTAssertEqual(decode[0].geoLocation?.coordinates[1], 50.775)
    }
    
    func testEncodalbe() throws {
        let decode = try JSONDecoder().decode([MeteorModel].self, from: self.JosnData!)
        let encoded = try? JSONEncoder().encode(decode)
        XCTAssertNotNil(encoded)
    }
    
    func testgetDate() throws {
        let decode = try JSONDecoder().decode([MeteorModel].self, from: self.JosnData!)
        XCTAssertEqual(decode.count, 2)
        XCTAssertNotNil(decode[0].getDate())
        XCTAssertEqual(decode[0].getDate().GetYear(), 1880)
    }
    
    func testgetMass() throws {
        let decode = try JSONDecoder().decode([MeteorModel].self, from: self.JosnData!)
        XCTAssertEqual(decode.count, 2)
        XCTAssertEqual(decode[0].getMass(), 21)
    }
    
    func testgetLocation() throws {
        let decode = try JSONDecoder().decode([MeteorModel].self, from: self.JosnData!)
        XCTAssertEqual(decode.count, 2)
        let place = decode[0].getLocation()
        XCTAssertNotNil(place)
        XCTAssertEqual(place.latitude, 50.775)
        XCTAssertEqual(place.longitude, 6.08333)
    }

    func testgetLocationArr() throws {
        let decode = try JSONDecoder().decode([MeteorModel].self, from: self.JosnData!)
        XCTAssertEqual(decode.count, 2)
        let place = decode[0].getLocationArr()
        XCTAssertEqual(place.count, 1)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
