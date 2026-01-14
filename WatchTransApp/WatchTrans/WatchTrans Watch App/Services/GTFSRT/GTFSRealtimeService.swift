//
//  GTFSRealtimeService.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//  Service for fetching GTFS-Realtime data from Renfe API
//

import Foundation

@Observable
class GTFSRealtimeService {
    private let networkService: NetworkService
    private let tripUpdatesURL = URL(string: "https://gtfsrt.renfe.com/trip_updates.json")!
    private let vehiclePositionsURL = URL(string: "https://gtfsrt.renfe.com/vehicle_positions.json")!
    private let alertsURL = URL(string: "https://gtfsrt.renfe.com/alerts.json")!

    var isLoading = false
    var lastFetchTime: Date?

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    /// Fetch trip updates (arrivals/departures) from GTFS-RT API
    func fetchTripUpdates() async throws -> GTFSRealtimeFeed {
        isLoading = true
        defer { isLoading = false }

        do {
            let feed: GTFSRealtimeFeed = try await networkService.fetch(tripUpdatesURL)
            lastFetchTime = Date()
            return feed
        } catch {
            print("⚠️ [GTFS-RT] Failed to fetch trip updates: \(error)")
            throw error
        }
    }

    /// Fetch trip updates filtered by stop ID
    /// Note: The API returns all updates, so filtering happens client-side
    func fetchTripUpdates(for stopId: String) async throws -> GTFSRealtimeFeed {
        let feed = try await fetchTripUpdates()

        // Filter entities that have updates for this stop
        let filteredEntities = feed.entity.filter { entity in
            guard let tripUpdate = entity.tripUpdate else { return false }
            return tripUpdate.stopTimeUpdate.contains { $0.stopId == stopId }
        }

        return GTFSRealtimeFeed(
            header: feed.header,
            entity: filteredEntities
        )
    }

    /// Fetch vehicle positions (for future enhancement)
    func fetchVehiclePositions() async throws -> GTFSRealtimeFeed {
        isLoading = true
        defer { isLoading = false }

        let feed: GTFSRealtimeFeed = try await networkService.fetch(vehiclePositionsURL)
        lastFetchTime = Date()
        return feed
    }

    /// Fetch service alerts (for future enhancement)
    func fetchAlerts() async throws -> GTFSRealtimeFeed {
        isLoading = true
        defer { isLoading = false }

        let feed: GTFSRealtimeFeed = try await networkService.fetch(alertsURL)
        lastFetchTime = Date()
        return feed
    }
}
