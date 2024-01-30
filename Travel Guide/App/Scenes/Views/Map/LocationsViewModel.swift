//
//  LocationsViewModel.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    //All loaded locations
    @Published var locations: [Location]
    
    //current location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    //current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location:Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        DispatchQueue.main.async {
            guard let currentIndex = self.locations.firstIndex(where: { $0 == self.mapLocation }) else {
                return
            }
            let nextIndex = currentIndex + 1
            guard self.locations.indices.contains(nextIndex) else {
                guard let firstLocation = self.locations.first else { return }
                self.showNextLocation(location: firstLocation)
                return
            }
            let nextLocation = self.locations[nextIndex]
            self.showNextLocation(location: nextLocation)
        }
    }
}
