//
//  StoreDataMgrTest.swift
//  Amazing meteorTests
//
//  Created by venus on 9/23/21.
//

import XCTest
@testable import Amazing_meteor

class StoreDataMgrTest: XCTestCase {

    private var meteor: [MeteorModel]!
    private var storeDatMgr: StoreDataMgr!
    let JosnData = """
        [{"name":"Aachen","id":"1","nametype":"Valid","recclass":"L5","mass":"21","fall":"Fell","year":"1880-01-01T00:00:00.000","reclat":"50.775000","reclong":"6.083330","geolocation":{"type":"Point","coordinates":[6.08333,50.775]}}
        ,{"name":"Aarhus","id":"2","nametype":"Valid","recclass":"H6","mass":"720","fall":"Fell","year":"1951-01-01T00:00:00.000","reclat":"56.183330","reclong":"10.233330","geolocation":{"type":"Point","coordinates":[10.23333,56.18333]}}]
        """.data(using: .utf8)
    
    override func setUpWithError() throws {
        let decode = try JSONDecoder().decode([MeteorModel].self, from: self.JosnData!)
        meteor = decode
        storeDatMgr = StoreDataMgr()
    }

    override func tearDownWithError() throws {
        _ = storeDatMgr.objectWillChange.sink
            {
                let checkmeterlist = self.storeDatMgr.load()
                for i in 0 ... checkmeterlist.count {
                    self.storeDatMgr.delete(meteor: self.meteor[i])
                }
            }
        meteor = nil
        storeDatMgr = nil
    }
    
   func testsaveData()  throws{
    _ = storeDatMgr.objectWillChange.sink
        {
            self.storeDatMgr.save(meteor: self.meteor[0])
            let checkmeterlist = self.storeDatMgr.load()
            XCTAssert(checkmeterlist.count == 1)
            XCTAssertEqual(checkmeterlist[0].name, "Aachen")
            XCTAssertEqual(checkmeterlist[0].id, "1")
            XCTAssertEqual(checkmeterlist[0].nametype, "Valid")
            XCTAssertEqual(checkmeterlist[0].recclass, "L5")
            XCTAssertEqual(checkmeterlist[0].mass, "21")
            XCTAssertEqual(checkmeterlist[0].year, "1880-01-01T00:00:00.000")
            XCTAssertEqual(checkmeterlist[0].reclat, "50.775000")
            XCTAssertEqual(checkmeterlist[0].reclon, "6.083330")
            XCTAssertEqual(checkmeterlist[0].geoLocation?.type, "Point")
            XCTAssertEqual(checkmeterlist[0].geoLocation?.coordinates.count, 2)
            XCTAssertEqual(checkmeterlist[0].geoLocation?.coordinates[0], 6.08333)
            XCTAssertEqual(checkmeterlist[0].geoLocation?.coordinates[1], 50.775)
        }
    }
    
    func testloadData() throws {
        _ = storeDatMgr.objectWillChange.sink
            {
                self.storeDatMgr.save(meteor: self.meteor[0])
                self.storeDatMgr.save(meteor: self.meteor[1])
                let checkmeterlist = self.storeDatMgr.load()
                XCTAssert(checkmeterlist.count == 2)
                XCTAssertEqual(checkmeterlist[0].name, "Aachen")
                XCTAssertEqual(checkmeterlist[0].id, "1")
                XCTAssertEqual(checkmeterlist[0].nametype, "Valid")
                XCTAssertEqual(checkmeterlist[0].recclass, "L5")
                XCTAssertEqual(checkmeterlist[0].mass, "21")
                XCTAssertEqual(checkmeterlist[0].year, "1880-01-01T00:00:00.000")
                XCTAssertEqual(checkmeterlist[0].reclat, "50.775000")
                XCTAssertEqual(checkmeterlist[0].reclon, "6.083330")
                XCTAssertEqual(checkmeterlist[0].geoLocation?.type, "Point")
                XCTAssertEqual(checkmeterlist[0].geoLocation?.coordinates.count, 2)
                XCTAssertEqual(checkmeterlist[0].geoLocation?.coordinates[0], 6.08333)
                XCTAssertEqual(checkmeterlist[0].geoLocation?.coordinates[1], 50.775)
            }
    }
    
    func testdeleteData() throws {
        _ = storeDatMgr.objectWillChange.sink
            {
                self.storeDatMgr.save(meteor: self.meteor[0])
                let checkmeterlist = self.storeDatMgr.load()
                XCTAssert(checkmeterlist.count == 1)
                self.storeDatMgr.delete(meteor: self.meteor[0])
                XCTAssert(checkmeterlist.count == 0)
            }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
