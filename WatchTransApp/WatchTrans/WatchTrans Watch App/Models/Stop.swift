//
//  Stop.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//

import Foundation
import CoreLocation

struct Stop: Identifiable, Codable, Equatable {
    let id: String
    let name: String          // "Sol", "Atocha"
    let latitude: Double
    let longitude: Double
    let connectionLineIds: [String]   // IDs of other lines at this stop

    // Computed property for CLLocation
    var location: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }

    // Calculate distance from current location
    func distance(from location: CLLocation) -> Double {
        return self.location.distance(from: location)
    }

    // Format distance for display
    func formattedDistance(from location: CLLocation) -> String {
        let distanceInMeters = distance(from: location)

        if distanceInMeters < 1000 {
            return "\(Int(distanceInMeters))m"
        } else {
            let distanceInKm = distanceInMeters / 1000
            return String(format: "%.1fkm", distanceInKm)
        }
    }
}
