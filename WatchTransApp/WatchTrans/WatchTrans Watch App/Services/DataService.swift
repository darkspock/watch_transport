//
//  DataService.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//

import Foundation

@Observable
class DataService {
    var lines: [Line] = []
    var stops: [Stop] = []
    var isLoading = false
    var error: Error?

    // MARK: - Public Methods

    // Fetch all lines and stops (placeholder for NAP API integration)
    func fetchTransportData() async {
        isLoading = true
        defer { isLoading = false }

        // TODO: Replace with actual NAP API call
        // For now, load mock data
        await loadMockData()
    }

    // Fetch arrivals for a specific stop (placeholder for NAP API integration)
    func fetchArrivals(for stopId: String) async -> [Arrival] {
        // TODO: Replace with actual GTFS-RT API call
        // For now, return mock arrivals
        return generateMockArrivals(for: stopId)
    }

    // Get stop by ID
    func getStop(by id: String) -> Stop? {
        return stops.first { $0.id == id }
    }

    // Get line by ID
    func getLine(by id: String) -> Line? {
        return lines.first { $0.id == id }
    }

    // MARK: - Mock Data (Temporary)

    private func loadMockData() async {
        // Mock Madrid Metro Line 1
        let line1Stops = [
            Stop(id: "stop_pinar", name: "Pinar de Chamartín", latitude: 40.4595, longitude: -3.6802, connectionLineIds: ["line4"]),
            Stop(id: "stop_bambú", name: "Bambú", latitude: 40.4553, longitude: -3.6802, connectionLineIds: []),
            Stop(id: "stop_chamartin", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line10"]),
            Stop(id: "stop_sol", name: "Sol", latitude: 40.4169, longitude: -3.7033, connectionLineIds: ["line2", "line3"]),
        ]

        let line1 = Line(
            id: "line1",
            name: "L1",
            type: .metro,
            colorHex: "#1E90FF",
            stops: line1Stops
        )

        // Mock Cercanías C3
        let c3Stops = [
            Stop(id: "stop_chamartin_c", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line1", "line10"]),
            Stop(id: "stop_nuevos_ministerios", name: "Nuevos Ministerios", latitude: 40.4461, longitude: -3.6926, connectionLineIds: ["line6", "line8", "line10"]),
            Stop(id: "stop_sol_c", name: "Sol", latitude: 40.4169, longitude: -3.7033, connectionLineIds: ["line1", "line2", "line3"]),
            Stop(id: "stop_atocha", name: "Atocha", latitude: 40.4067, longitude: -3.6909, connectionLineIds: ["line1"]),
        ]

        let lineC3 = Line(
            id: "c3",
            name: "C3",
            type: .cercanias,
            colorHex: "#FF6B35",
            stops: c3Stops
        )

        lines = [line1, lineC3]
        stops = line1Stops + c3Stops
    }

    private func generateMockArrivals(for stopId: String) -> [Arrival] {
        let now = Date()

        return [
            Arrival(
                id: UUID().uuidString,
                lineId: "line1",
                lineName: "L1",
                destination: "Valdecarros",
                scheduledTime: now.addingTimeInterval(3 * 60),
                expectedTime: now.addingTimeInterval(3 * 60),
                platform: "1"
            ),
            Arrival(
                id: UUID().uuidString,
                lineId: "line1",
                lineName: "L1",
                destination: "Pinar de Chamartín",
                scheduledTime: now.addingTimeInterval(7 * 60),
                expectedTime: now.addingTimeInterval(10 * 60), // 3 min delay
                platform: "2"
            ),
            Arrival(
                id: UUID().uuidString,
                lineId: "c3",
                lineName: "C3",
                destination: "Aranjuez",
                scheduledTime: now.addingTimeInterval(12 * 60),
                expectedTime: now.addingTimeInterval(12 * 60),
                platform: "3"
            ),
        ]
    }
}
