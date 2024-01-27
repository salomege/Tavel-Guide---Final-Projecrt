//
//  Location.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let cityName: String
    let name: String
    let coordinates: CLLocationCoordinate2D
    
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
