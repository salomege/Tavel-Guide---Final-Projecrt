//
//  LocationsDataService.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            cityName: "Tbilisi",
            name: "City center",
            coordinates: CLLocationCoordinate2D(latitude: 41.691797, longitude: 44.800846)
            
),
        Location(
            cityName: "Mtskheta",
            name: "Svetitskhoveli",
            coordinates: CLLocationCoordinate2D(latitude: 41.842010, longitude: 44.720892)
            ),
        Location(
            cityName: "Stepantsminda",
            name: "Gergeti church",
            coordinates: CLLocationCoordinate2D(latitude: 42.662129, longitude: 44.620408)
        ),
        Location(
            cityName: "Imereti",
            name: "Kutaisi",
            coordinates: CLLocationCoordinate2D(latitude: 42.270675, longitude: 42.706934)
            ),
        Location(
            cityName: "Adjara",
            name: "Batumi",
            coordinates: CLLocationCoordinate2D(latitude: 41.638348, longitude: 41.634052)
        ),
    ]
    
}
