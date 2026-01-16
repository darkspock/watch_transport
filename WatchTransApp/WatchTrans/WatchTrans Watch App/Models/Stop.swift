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

    // Additional fields from RenfeServer API
    let province: String?
    let nucleoName: String?   // Network name (e.g., "madrid", "sevilla")
    let accesibilidad: String?
    let hasParking: Bool
    let hasBusConnection: Bool
    let hasMetroConnection: Bool

    init(id: String, name: String, latitude: Double, longitude: Double, connectionLineIds: [String],
         province: String? = nil, nucleoName: String? = nil, accesibilidad: String? = nil,
         hasParking: Bool = false, hasBusConnection: Bool = false, hasMetroConnection: Bool = false) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.connectionLineIds = connectionLineIds
        self.province = province
        self.nucleoName = nucleoName
        self.accesibilidad = accesibilidad
        self.hasParking = hasParking
        self.hasBusConnection = hasBusConnection
        self.hasMetroConnection = hasMetroConnection
    }

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
