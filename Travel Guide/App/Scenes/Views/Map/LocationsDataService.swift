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
            cityName: "Old Town",
            name: "Tbilisi",
            coordinates: CLLocationCoordinate2D(latitude: 41.691797, longitude: 44.800846)
            
),
        Location(
            cityName: "Svetitskhoveli",
            name: "Mtskheta",
            coordinates: CLLocationCoordinate2D(latitude: 41.842010, longitude: 44.720892)
            ),
        Location(
            cityName: "Gergeti",
            name: "Kazbegi",
            coordinates: CLLocationCoordinate2D(latitude: 42.662129, longitude: 44.620408)
        ),
        Location(
            cityName: "Bagrati",
            name: "Kutaisi",
            coordinates: CLLocationCoordinate2D(latitude: 42.270675, longitude: 42.706934)
            ),
        Location(
            cityName: "City center",
            name: "Batumi",
            coordinates: CLLocationCoordinate2D(latitude: 41.638348, longitude: 41.634052)
        ),
        Location(
            cityName: "Mestia",
            name: "Svaneti",
            coordinates: CLLocationCoordinate2D(latitude: 43.032029, longitude: 42.692388)
        ),
    ]
    
}
