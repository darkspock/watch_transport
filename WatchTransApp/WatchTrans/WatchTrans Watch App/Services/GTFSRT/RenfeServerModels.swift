//
//  RenfeServerModels.swift
//  WatchTrans Watch App
//
//  Created by Claude on 15/1/26.
//  Codable models for RenfeServer API responses (juanmacias.com:8002)
//

import Foundation

// MARK: - Departure Response

/// Response from GET /api/v1/gtfs/stops/{stop_id}/departures
struct DepartureResponse: Codable, Identifiable {
    let tripId: String
    let routeId: String
    let routeShortName: String
    let routeColor: String?
    let headsign: String?
    let departureTime: String      // "HH:mm:ss" format
    let departureSeconds: Int      // Seconds since midnight
    let minutesUntil: Int
    let stopSequence: Int

    var id: String { tripId }

    enum CodingKeys: String, CodingKey {
        case headsign
        case tripId = "trip_id"
        case routeId = "route_id"
        case routeShortName = "route_short_name"
        case routeColor = "route_color"
        case departureTime = "departure_time"
        case departureSeconds = "departure_seconds"
        case minutesUntil = "minutes_until"
        case stopSequence = "stop_sequence"
    }
}

// MARK: - ETA Response

/// Response from GET /api/v1/gtfs/eta/stops/{stop_id}
struct ETAResponse: Codable, Identifiable {
    let tripId: String
    let stopId: String
    let scheduledArrival: Date
    let estimatedArrival: Date
    let delaySeconds: Int
    let delayMinutes: Int
    let isDelayed: Bool
    let isOnTime: Bool
    let confidenceLevel: String    // "high", "medium", "low"
    let calculationMethod: String
    let vehicleId: String?
    let distanceToStopMeters: Double?
    let currentStopId: String?
    let calculatedAt: Date

    var id: String { "\(tripId)_\(stopId)" }
}

// MARK: - Stop Delay Response

/// Response from GET /api/v1/gtfs/realtime/stops/{stop_id}/delays
struct StopDelayResponse: Codable {
    let tripId: String
    let stopId: String
    let arrivalDelay: Int?
    let arrivalTime: Date?
    let departureDelay: Int?
    let departureTime: Date?
}

// MARK: - Vehicle Position Response

/// Response from GET /api/v1/gtfs/realtime/vehicles
struct VehiclePositionResponse: Codable, Identifiable {
    let vehicleId: String
    let tripId: String
    let position: PositionSchema
    let currentStatus: String
    let stopId: String?
    let label: String?
    let timestamp: Date
    let updatedAt: Date?

    var id: String { vehicleId }
}

struct PositionSchema: Codable {
    let latitude: Double
    let longitude: Double
}

// MARK: - Network Response

/// Response from GET /api/v1/gtfs/networks
struct NetworkResponse: Codable, Identifiable {
    let code: String
    let name: String
    let city: String
    let region: String
    let color: String
    let textColor: String
    let logoUrl: String?
    let wikipediaUrl: String?
    let description: String?
    let routeCount: Int

    var id: String { code }

    enum CodingKeys: String, CodingKey {
        case code, name, city, region, color, description
        case textColor = "text_color"
        case logoUrl = "logo_url"
        case wikipediaUrl = "wikipedia_url"
        case routeCount = "route_count"
    }
}

// MARK: - Network Detail Response

/// Response from GET /api/v1/gtfs/networks/{code}
struct NetworkDetailResponse: Codable, Identifiable {
    let code: String
    let name: String
    let city: String
    let region: String
    let color: String
    let textColor: String
    let logoUrl: String?
    let wikipediaUrl: String?
    let description: String?
    let routeCount: Int
    let lines: [LineResponse]

    var id: String { code }

    enum CodingKeys: String, CodingKey {
        case code, name, city, region, color, description, lines
        case textColor = "text_color"
        case logoUrl = "logo_url"
        case wikipediaUrl = "wikipedia_url"
        case routeCount = "route_count"
    }
}

// MARK: - Line Response

/// Line within a network
struct LineResponse: Codable, Identifiable {
    let lineCode: String
    let color: String
    let textColor: String
    let routeCount: Int
    let routes: [[String: AnyCodableValue]]  // Flexible structure for route details

    var id: String { lineCode }

    enum CodingKeys: String, CodingKey {
        case color, routes
        case lineCode = "line_code"
        case textColor = "text_color"
        case routeCount = "route_count"
    }
}

// MARK: - Route Response

/// Response from GET /api/v1/gtfs/routes
struct RouteResponse: Codable, Identifiable {
    let id: String
    let shortName: String
    let longName: String
    let routeType: Int
    let color: String?
    let textColor: String?
    let agencyId: String

    enum CodingKeys: String, CodingKey {
        case id, color
        case shortName = "short_name"
        case longName = "long_name"
        case routeType = "route_type"
        case textColor = "text_color"
        case agencyId = "agency_id"
    }
}

// MARK: - Stop Response

/// Response from GET /api/v1/gtfs/stops
struct StopResponse: Codable, Identifiable {
    let id: String
    let name: String
    let lat: Double
    let lon: Double
    let code: String?
    let locationType: Int
    let parentStationId: String?
    let zoneId: String?

    enum CodingKeys: String, CodingKey {
        case id, name, lat, lon, code
        case locationType = "location_type"
        case parentStationId = "parent_station_id"
        case zoneId = "zone_id"
    }
}

// MARK: - Trip Detail Response

/// Response from GET /api/v1/gtfs/trips/{trip_id}
struct TripDetailResponse: Codable, Identifiable {
    let id: String
    let routeId: String
    let routeShortName: String
    let routeLongName: String
    let routeColor: String?
    let headsign: String?
    let directionId: Int?
    let stops: [TripStopResponse]

    enum CodingKeys: String, CodingKey {
        case id, headsign, stops
        case routeId = "route_id"
        case routeShortName = "route_short_name"
        case routeLongName = "route_long_name"
        case routeColor = "route_color"
        case directionId = "direction_id"
    }
}

struct TripStopResponse: Codable {
    let stopId: String
    let stopName: String
    let arrivalTime: String
    let departureTime: String
    let stopSequence: Int
    let stopLat: Double
    let stopLon: Double

    enum CodingKeys: String, CodingKey {
        case stopId = "stop_id"
        case stopName = "stop_name"
        case arrivalTime = "arrival_time"
        case departureTime = "departure_time"
        case stopSequence = "stop_sequence"
        case stopLat = "stop_lat"
        case stopLon = "stop_lon"
    }
}

// MARK: - Trip Update Response (Realtime)

/// Response from GET /api/v1/gtfs/realtime/delays
struct TripUpdateResponse: Codable, Identifiable {
    let tripId: String
    let delay: Int
    let delayMinutes: Int
    let isDelayed: Bool
    let vehicleId: String?
    let wheelchairAccessible: Bool?
    let timestamp: Date
    let updatedAt: Date?

    var id: String { tripId }
}

// MARK: - AnyCodableValue for flexible JSON

/// Helper for decoding flexible JSON structures
enum AnyCodableValue: Codable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if container.decodeNil() {
            self = .null
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else if let double = try? container.decode(Double.self) {
            self = .double(double)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else {
            self = .null
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value): try container.encode(value)
        case .int(let value): try container.encode(value)
        case .double(let value): try container.encode(value)
        case .bool(let value): try container.encode(value)
        case .null: try container.encodeNil()
        }
    }
}
