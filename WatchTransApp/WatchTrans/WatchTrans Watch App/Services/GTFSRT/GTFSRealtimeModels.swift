//
//  GTFSRealtimeModels.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//  Codable models for GTFS-Realtime JSON responses
//

import Foundation

// MARK: - Root Feed Message

struct GTFSRealtimeFeed: Codable {
    let header: FeedHeader
    let entity: [FeedEntity]
}

// MARK: - Feed Header

struct FeedHeader: Codable {
    let gtfsRealtimeVersion: String
    let timestamp: String  // Unix timestamp as string
}

// MARK: - Feed Entity

struct FeedEntity: Codable {
    let id: String
    let tripUpdate: TripUpdate?
}

// MARK: - Trip Update

struct TripUpdate: Codable {
    let trip: Trip
    let stopTimeUpdate: [StopTimeUpdate]
    let vehicle: Vehicle?
    let delay: Int?  // Overall delay in seconds
}

// MARK: - Trip

struct Trip: Codable {
    let tripId: String
    let routeId: String?  // Often not provided by Renfe
    let directionId: Int?  // Often not provided
    let scheduleRelationship: ScheduleRelationship

    enum CodingKeys: String, CodingKey {
        case tripId
        case routeId
        case directionId
        case scheduleRelationship
    }
}

enum ScheduleRelationship: String, Codable {
    case scheduled = "SCHEDULED"
    case cancelled = "CANCELLED"
    case added = "ADDED"
    case unscheduled = "UNSCHEDULED"
    case replacement = "REPLACEMENT"
}

// MARK: - Stop Time Update

struct StopTimeUpdate: Codable {
    let stopSequence: Int?
    let stopId: String
    let arrival: StopTimeEvent?
    let departure: StopTimeEvent?
}

// MARK: - Stop Time Event

struct StopTimeEvent: Codable {
    let time: Int64?  // Unix timestamp
    let delay: Int?  // Delay in seconds (can be negative for early)

    enum CodingKeys: String, CodingKey {
        case time
        case delay
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Handle time as either String or Int64
        if let timeString = try? container.decode(String.self, forKey: .time) {
            self.time = Int64(timeString)
        } else if let timeInt = try? container.decode(Int64.self, forKey: .time) {
            self.time = timeInt
        } else {
            self.time = nil
        }

        // Handle delay as either String or Int
        if let delayString = try? container.decode(String.self, forKey: .delay) {
            self.delay = Int(delayString)
        } else if let delayInt = try? container.decode(Int.self, forKey: .delay) {
            self.delay = delayInt
        } else {
            self.delay = nil
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(time, forKey: .time)
        try container.encodeIfPresent(delay, forKey: .delay)
    }
}

// MARK: - Vehicle

struct Vehicle: Codable {
    let id: String?
    let label: String?
    let licensePlate: String?
    let wheelchairAccessible: WheelchairAccessibility?
}

enum WheelchairAccessibility: String, Codable {
    case unknown = "UNKNOWN"
    case accessible = "WHEELCHAIR_ACCESSIBLE"
    case inaccessible = "WHEELCHAIR_INACCESSIBLE"
}

// MARK: - Helpers

extension Trip {
    /// Extract line code from tripId (e.g., "3010X23522C1" → "C1")
    var extractedLineCode: String? {
        // Pattern: ends with C followed by digits (C1, C2, etc.) or T followed by digits (T1, T2, etc.)
        let pattern = "[CT][0-9]+[a-z]?$"
        if let range = tripId.range(of: pattern, options: .regularExpression) {
            return String(tripId[range])
        }
        return nil
    }
}

extension StopTimeUpdate {
    /// Convert arrival time to Date
    var arrivalDate: Date? {
        guard let arrivalEvent = arrival, let time = arrivalEvent.time else {
            return nil
        }
        return Date(timeIntervalSince1970: TimeInterval(time))
    }

    /// Get arrival delay in seconds (0 if no delay info)
    var arrivalDelay: Int {
        return arrival?.delay ?? 0
    }

    /// Calculate expected arrival time (scheduled + delay)
    var expectedArrivalDate: Date? {
        guard let scheduled = arrivalDate else { return nil }
        return scheduled.addingTimeInterval(TimeInterval(arrivalDelay))
    }
}
