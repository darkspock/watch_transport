//
//  GTFSRealtimeMapper.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//  Maps GTFS-Realtime data to app's Arrival model
//

import Foundation

class GTFSRealtimeMapper {
    private weak var dataService: DataService?

    init(dataService: DataService) {
        self.dataService = dataService
    }

    /// Map GTFS-RT feed to Arrival models for a specific stop
    func mapToArrivals(feed: GTFSRealtimeFeed, stopId: String) -> [Arrival] {
        guard let dataService = dataService else {
            print("⚠️ [GTFS-RT Mapper] DataService is nil!")
            return []
        }

        var arrivals: [Arrival] = []
        let now = Date()

        print("🗺️ [GTFS-RT Mapper] Processing \(feed.entity.count) entities for stop \(stopId)")

        for entity in feed.entity {
            guard let tripUpdate = entity.tripUpdate else { continue }

            // Skip cancelled trips
            if tripUpdate.trip.scheduleRelationship == .cancelled {
                continue
            }

            // Find stop time updates for our stop
            for stopTime in tripUpdate.stopTimeUpdate where stopTime.stopId == stopId {
                guard let arrivalDate = stopTime.arrivalDate else { continue }

                // Only include future arrivals
                let expectedDate = stopTime.expectedArrivalDate ?? arrivalDate
                guard expectedDate > now else { continue }

                // Extract line code from trip ID
                guard let lineCode = tripUpdate.trip.extractedLineCode else {
                    print("⚠️ [GTFS-RT Mapper] Could not extract line code from trip: \(tripUpdate.trip.tripId)")
                    continue
                }

                // Map line code to app's Line object
                guard let line = mapLineCode(lineCode, forStopId: stopId, dataService: dataService) else {
                    print("⚠️ [GTFS-RT Mapper] Could not map line code '\(lineCode)' to Line for stop \(stopId)")
                    continue
                }

                // Determine destination
                let destination = determineDestination(
                    tripUpdate: tripUpdate,
                    line: line,
                    currentStopId: stopId
                )

                // Create Arrival
                let arrival = Arrival(
                    id: entity.id,
                    lineId: line.id,
                    lineName: line.name,
                    destination: destination,
                    scheduledTime: arrivalDate,
                    expectedTime: expectedDate,
                    platform: nil  // Platform info would be in vehicle positions feed
                )

                print("✅ [GTFS-RT Mapper] Created arrival: \(line.name) to \(destination) at \(expectedDate)")

                arrivals.append(arrival)
            }
        }

        // Sort by expected time and return closest arrivals
        let sortedArrivals = arrivals
            .sorted { $0.expectedTime < $1.expectedTime }
            .prefix(10)  // Reasonable limit
            .map { $0 }

        print("✅ [GTFS-RT Mapper] Mapped \(arrivals.count) total arrivals, returning top \(sortedArrivals.count)")

        return Array(sortedArrivals)
    }

    // MARK: - Private Helpers

    /// Map line code (e.g., "C1") to app's Line object
    /// Requires knowing which city/network this stop belongs to
    private func mapLineCode(_ lineCode: String, forStopId stopId: String, dataService: DataService) -> Line? {
        // Find which lines serve this stop
        let linesServingStop = dataService.lines.filter { line in
            line.stops.contains { $0.id == stopId }
        }

        // Match line code to one of these lines
        // e.g., "C1" matches "sevilla_c1" or "madrid_c1"
        let normalizedCode = lineCode.uppercased()

        for line in linesServingStop {
            // Extract code from line name (e.g., "C1" from line with name "C1")
            if line.name.uppercased() == normalizedCode {
                return line
            }

            // Also check ID suffix (e.g., "madrid_c1" ends with "c1")
            if line.id.uppercased().hasSuffix(normalizedCode.lowercased()) {
                return line
            }
        }

        // Fallback: try to match without city prefix
        return dataService.lines.first { line in
            line.name.uppercased() == normalizedCode
        }
    }

    /// Determine destination for this trip
    private func determineDestination(tripUpdate: TripUpdate, line: Line, currentStopId: String) -> String {
        // Find current stop's position in the line
        guard let currentStopIndex = line.stops.firstIndex(where: { $0.id == currentStopId }) else {
            // Fallback: return line's last stop
            return line.stops.last?.name ?? "Unknown"
        }

        let totalStops = line.stops.count

        // Determine direction based on stop position
        // If stop is in first half of line, destination is likely last stop
        // If stop is in second half, destination is likely first stop
        if currentStopIndex < totalStops / 2 {
            // Going towards end of line
            return line.stops.last?.name ?? "Unknown"
        } else {
            // Going towards start of line
            return line.stops.first?.name ?? "Unknown"
        }

        // Note: This is a heuristic since GTFS-RT doesn't provide directionId
        // A more robust solution would use the full trip schedule from static GTFS
    }
}

// MARK: - Debug Helpers

extension GTFSRealtimeMapper {
    /// Debug: Print all unique line codes found in feed
    func debugLineCodes(feed: GTFSRealtimeFeed) {
        var lineCodes = Set<String>()

        for entity in feed.entity {
            guard let tripUpdate = entity.tripUpdate,
                  let lineCode = tripUpdate.trip.extractedLineCode else { continue }
            lineCodes.insert(lineCode)
        }

        print("📊 [GTFS-RT Mapper] Found line codes: \(lineCodes.sorted())")
    }

    /// Debug: Print all unique stop IDs in feed
    func debugStopIds(feed: GTFSRealtimeFeed) {
        var stopIds = Set<String>()

        for entity in feed.entity {
            guard let tripUpdate = entity.tripUpdate else { continue }
            for stopTime in tripUpdate.stopTimeUpdate {
                stopIds.insert(stopTime.stopId)
            }
        }

        print("📊 [GTFS-RT Mapper] Found \(stopIds.count) unique stops: \(stopIds.sorted().prefix(20))")
    }
}
