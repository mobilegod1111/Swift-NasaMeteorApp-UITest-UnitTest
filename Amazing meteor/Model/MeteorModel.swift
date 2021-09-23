//
//  MeteorsModel.swift
//  Amazing meteor
//
//  Created by venus on 9/20/21.
//

import SwiftUI

struct MeteorModel {
    var id: String?
    var name:String?
    var year: String?
    var nametype: String?
    var recclass: String?
    var mass:String?
    var reclon:String?
    var reclat:String?
    var geoLocation:GeoLocation?
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case year = "year"
        case nametype = "nametype"
        case recclass = "recclass"
        case mass = "mass"
        case geoLocation = "geolocation"
        case reclon = "reclong"
        case reclat = "reclat"
    }
    
    func getDate() -> Date {
        let _date = self.year?.StrToDate(format: "yyyy-MM-dd'T'HH:mm:ss.SSS") ?? Date()
        return _date
    }
    
    func getMass() -> Double {
        let mass = Double(self.mass ?? "0.0") ?? 0.0
        return mass
    }
    
    func getLocation() -> Place {
        let place = Place(latitude: self.geoLocation?.coordinates[1] ?? 0.0, longitude: self.geoLocation?.coordinates[0] ?? 0.0)
        return place
    }
    
    func getLocationArr() -> [Place] {
        var placeArr = [Place]()
        placeArr.append(Place(latitude: self.geoLocation?.coordinates[1] ?? 0.0, longitude: self.geoLocation?.coordinates[0] ?? 0.0))
        return placeArr
    }
}

extension MeteorModel: Decodable {
    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.geoLocation = try values.decode(GeoLocation.self, forKey: .geoLocation)
            self.id = try values.decode(String.self, forKey: .id)
            self.name = try values.decode(String.self, forKey: .name)
            self.year = try values.decode(String.self, forKey: .year)
            self.nametype = try values.decode(String.self, forKey: .nametype)
            self.recclass = try values.decode(String.self, forKey: .recclass)
            self.mass = try values.decode(String.self, forKey: .mass)
            self.reclon = try values.decode(String.self, forKey: .reclon)
            self.reclat = try values.decode(String.self, forKey: .reclat)
        }
        catch {
            print("MeteorModel Decodable Error")
        }
    }
}

extension MeteorModel: Encodable {
    init(to encoder: Encoder) throws {
        do {
            var values = encoder.container(keyedBy: CodingKeys.self)
            try values.encode(self.id, forKey: .id)
            try values.encode(self.name, forKey: .name)
            try values.encode(self.year, forKey: .year)
            try values.encode(self.nametype, forKey: .nametype)
            try values.encode(self.recclass, forKey: .recclass)
            try values.encode(self.mass, forKey: .mass)
            try values.encode(self.reclon, forKey: .reclon)
            try values.encode(self.reclat, forKey: .reclat)
            let geoLocation = try? JSONEncoder().encode(self.geoLocation)
            try values.encode(geoLocation, forKey: .geoLocation)
        }
        catch {
            print("MeteorModel Encodable Error")
        }
    }
}
