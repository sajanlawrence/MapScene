//
//  Location.swift
//  MapApp
//
//  Created by Sajan Lawrence on 09/09/25.
//

import Foundation
import MapKit

struct Location: Identifiable{
    let id: String = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    static let `default` = Location(
        name: "Pantheon",
        cityName: "Rome",
        coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
        description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
        imageNames: [
            "rome-pantheon-1",
            "rome-pantheon-2",
            "rome-pantheon-3",
        ],
        link: "https://en.wikipedia.org/wiki/Pantheon,_Rome")
}
