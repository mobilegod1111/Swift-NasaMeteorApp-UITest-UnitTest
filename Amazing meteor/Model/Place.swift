//
//  Place.swift
//  Amazing meteor
//
//  Created by venus on 9/22/21.
//

import MapKit
import SwiftUI

struct Place: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
