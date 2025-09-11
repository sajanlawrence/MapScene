//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Sajan Lawrence on 10/09/25.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject{
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet{
            updateCameraPosition(location: mapLocation)
        }
    }
    @Published var cameraPosition: MapCameraPosition
    var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        let firstLocation = locations.first ?? Location.default
        self.locations = locations
        self.mapLocation = firstLocation
        self.mapRegion = MKCoordinateRegion(center: firstLocation.coordinates, span: span)
        self.cameraPosition = MapCameraPosition.region(mapRegion)
    }
    
    func updateCameraPosition(location: Location){
        mapRegion = MKCoordinateRegion(center: location.coordinates, span: span)
        withAnimation(.easeInOut){
            cameraPosition = MapCameraPosition.region(mapRegion)
        }
    }
    
    func toggleLocationsList(){
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed(){
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
        
        var nextIndex = currentIndex + 1
        if nextIndex >= locations.count{
            nextIndex = 0
        }
        showNextLocation(location: locations[nextIndex])
    }
}
