//
//  GeoLocation.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import SwiftUI

struct GeoLocation {
    var type: String?
    var coordinates = [Double]()
    private enum CodingKeys: String, CodingKey {
        case type = "type"
        case coordinates = "coordinates"
    }
}

extension GeoLocation : Decodable {
    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)

            self.type = try values.decode(String.self, forKey: .type)
            self.coordinates = try values.decode([Double].self, forKey: .coordinates)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

extension GeoLocation : Encodable {
    init(to encoder: Encoder) throws {
        do {
            var values = encoder.container(keyedBy: CodingKeys.self)
            try values.encode(self.type, forKey: .type)
            try values.encode(self.coordinates, forKey: .coordinates)
        }
    }
}




