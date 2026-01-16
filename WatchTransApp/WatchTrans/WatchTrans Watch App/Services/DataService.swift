//
//  DataService.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//
//  UPDATED: 2026-01-16 - Now loads ALL data from RenfeServer API (juanmacias.com:8002)
//

import Foundation

@Observable
class DataService {
    var lines: [Line] = []
    var stops: [Stop] = []
    var networks: [NetworkResponse] = []
    var isLoading = false
    var error: Error?

    // MARK: - GTFS-Realtime Services

    private let networkService = NetworkService()
    private var _gtfsRealtimeService: GTFSRealtimeService?
    private var _gtfsMapper: GTFSRealtimeMapper?

    private var gtfsRealtimeService: GTFSRealtimeService {
        if _gtfsRealtimeService == nil {
            _gtfsRealtimeService = GTFSRealtimeService(networkService: networkService)
        }
        return _gtfsRealtimeService!
    }

    private var gtfsMapper: GTFSRealtimeMapper {
        if _gtfsMapper == nil {
            _gtfsMapper = GTFSRealtimeMapper(dataService: self)
        }
        return _gtfsMapper!
    }

    // MARK: - Arrival Cache

    private struct CacheEntry {
        let arrivals: [Arrival]
        let timestamp: Date

        var isValid: Bool {
            Date().timeIntervalSince(timestamp) < 60  // 60s TTL
        }

        var isStale: Bool {
            Date().timeIntervalSince(timestamp) < 300  // 5 min grace period
        }
    }

    private var arrivalCache: [String: CacheEntry] = [:]
    private let cacheLock = NSLock()

    // MARK: - Public Methods

    /// Fetch all networks from API
    func fetchNetworks() async {
        isLoading = true
        defer { isLoading = false }

        do {
            print("📡 [DataService] Fetching networks from API...")
            networks = try await gtfsRealtimeService.fetchNetworks()
            print("✅ [DataService] Loaded \(networks.count) networks")
        } catch {
            print("⚠️ [DataService] Failed to fetch networks: \(error)")
            self.error = error
        }
    }

    /// Fetch stops by coordinates (returns all stops in that province)
    func fetchStopsByCoordinates(latitude: Double, longitude: Double) async {
        isLoading = true
        defer { isLoading = false }

        do {
            print("📡 [DataService] Fetching stops for coordinates (\(latitude), \(longitude))...")
            let stopResponses = try await gtfsRealtimeService.fetchStopsByCoordinates(
                latitude: latitude,
                longitude: longitude,
                limit: 500
            )

            // Convert StopResponse to Stop model
            stops = stopResponses.map { response in
                Stop(
                    id: response.id,
                    name: response.name,
                    latitude: response.lat,
                    longitude: response.lon,
                    connectionLineIds: []  // Will be populated when we load routes
                )
            }

            print("✅ [DataService] Loaded \(stops.count) stops")
        } catch {
            print("⚠️ [DataService] Failed to fetch stops: \(error)")
            self.error = error
        }
    }

    /// Fetch all routes and convert to Lines
    func fetchRoutes() async {
        isLoading = true
        defer { isLoading = false }

        do {
            print("📡 [DataService] Fetching routes from API...")
            let routeResponses = try await gtfsRealtimeService.fetchRoutes()

            // Group routes by short name to create lines
            var lineDict: [String: Line] = [:]

            for route in routeResponses {
                let lineId = route.shortName.lowercased()

                if lineDict[lineId] == nil {
                    lineDict[lineId] = Line(
                        id: lineId,
                        name: route.shortName,
                        type: .cercanias,
                        colorHex: route.color.map { "#\($0)" } ?? "#75B6E0",
                        stops: [],
                        city: "España"  // API doesn't provide city per route
                    )
                }
            }

            lines = Array(lineDict.values)
            print("✅ [DataService] Loaded \(lines.count) lines")
        } catch {
            print("⚠️ [DataService] Failed to fetch routes: \(error)")
            self.error = error
        }
    }

    /// Fetch stops for a specific route
    func fetchStopsForRoute(routeId: String) async -> [Stop] {
        do {
            let stopResponses = try await gtfsRealtimeService.fetchRouteStops(routeId: routeId)
            return stopResponses.map { response in
                Stop(
                    id: response.id,
                    name: response.name,
                    latitude: response.lat,
                    longitude: response.lon,
                    connectionLineIds: []
                )
            }
        } catch {
            print("⚠️ [DataService] Failed to fetch stops for route \(routeId): \(error)")
            return []
        }
    }

    /// Initialize data - call this on app launch
    func fetchTransportData() async {
        isLoading = true
        defer { isLoading = false }

        // Fetch networks first
        await fetchNetworks()

        // Fetch routes to populate lines
        await fetchRoutes()

        print("✅ [DataService] Initial data load complete: \(networks.count) networks, \(lines.count) lines")
    }

    // Fetch arrivals for a specific stop using RenfeServer API
    func fetchArrivals(for stopId: String) async -> [Arrival] {
        print("🔍 [DataService] Fetching arrivals for stop: \(stopId)")

        // 1. Check cache first
        if let cached = getCachedArrivals(for: stopId) {
            print("✅ [DataService] Cache hit! Returning \(cached.count) cached arrivals")
            return cached
        }

        // 2. Fetch from RenfeServer API (juanmacias.com:8002)
        do {
            print("📡 [DataService] Cache miss, calling RenfeServer API...")
            let departures = try await gtfsRealtimeService.fetchDepartures(stopId: stopId, limit: 10)
            print("📊 [DataService] API returned \(departures.count) departures for stop \(stopId)")

            let arrivals = gtfsMapper.mapToArrivals(departures: departures, stopId: stopId)
            print("✅ [DataService] Mapped to \(arrivals.count) arrivals")

            // 3. Cache results
            cacheArrivals(arrivals, for: stopId)

            return arrivals
        } catch {
            // 4. Handle errors gracefully
            print("⚠️ [DataService] RenfeServer API Error: \(error)")

            // Try stale cache as fallback
            if let stale = getStaleCachedArrivals(for: stopId) {
                print("ℹ️ [DataService] Using stale cached data for stop \(stopId)")
                return stale
            }

            // Return empty array instead of mock data
            print("ℹ️ [DataService] No data available for stop \(stopId)")
            self.error = error
            return []
        }
    }

    // MARK: - Cache Helpers

    private func getCachedArrivals(for stopId: String) -> [Arrival]? {
        cacheLock.lock()
        defer { cacheLock.unlock() }

        guard let entry = arrivalCache[stopId], entry.isValid else {
            return nil
        }
        return entry.arrivals
    }

    private func cacheArrivals(_ arrivals: [Arrival], for stopId: String) {
        cacheLock.lock()
        defer { cacheLock.unlock() }

        arrivalCache[stopId] = CacheEntry(arrivals: arrivals, timestamp: Date())
    }

    private func getStaleCachedArrivals(for stopId: String) -> [Arrival]? {
        cacheLock.lock()
        defer { cacheLock.unlock() }

        guard let entry = arrivalCache[stopId], entry.isStale else {
            return nil
        }
        return entry.arrivals
    }

    /// Clear arrival cache (useful for pull-to-refresh)
    func clearArrivalCache() {
        cacheLock.lock()
        defer { cacheLock.unlock() }

        arrivalCache.removeAll()
    }

    // Get stop by ID
    func getStop(by id: String) -> Stop? {
        return stops.first { $0.id == id }
    }

    // Get line by ID
    func getLine(by id: String) -> Line? {
        return lines.first { $0.id == id }
    }

    /// Search stops by name
    func searchStops(query: String) async -> [Stop] {
        do {
            let stopResponses = try await gtfsRealtimeService.fetchStops(search: query, limit: 50)
            return stopResponses.map { response in
                Stop(
                    id: response.id,
                    name: response.name,
                    latitude: response.lat,
                    longitude: response.lon,
                    connectionLineIds: []
                )
            }
        } catch {
            print("⚠️ [DataService] Failed to search stops: \(error)")
            return []
        }
    }

    /// Get trip details
    func fetchTripDetails(tripId: String) async -> TripDetailResponse? {
        do {
            return try await gtfsRealtimeService.fetchTrip(tripId: tripId)
        } catch {
            print("⚠️ [DataService] Failed to fetch trip \(tripId): \(error)")
            return nil
        }
    }
}
