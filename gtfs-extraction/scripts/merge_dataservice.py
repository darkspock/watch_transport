#!/usr/bin/env python3
"""
Merge all complete GTFS extractions into DataService.swift
"""

# Read all the complete Swift files
networks = [
    ('madrid', 'Madrid'),
    ('sevilla', 'Sevilla'),
    ('barcelona', 'Barcelona'),
    ('valencia', 'Valencia'),
    ('málaga', 'Málaga'),
    ('bilbao_bizkaia', 'Bilbao'),
    ('san_sebastián_gipuzkoa', 'San Sebastián')
]

# Read all line definitions
all_line_definitions = []
all_line_names = []

for network_file, network_name in networks:
    with open(f'/Users/juanmaciasgomez/Downloads/{network_file}_COMPLETE.swift', 'r', encoding='utf-8') as f:
        content = f.read()

        # Extract line definitions (everything between "let" and city closing)
        lines = []
        current_line = []
        in_line_def = False

        for line in content.split('\n'):
            if line.strip().startswith('let ') and ' = Line(' in line:
                in_line_def = True
                current_line = [line]
                # Extract variable name
                var_name = line.split('let ')[1].split(' =')[0].strip()
                all_line_names.append(var_name)
            elif in_line_def:
                current_line.append(line)
                if line.strip() == ')':
                    # End of line definition
                    all_line_definitions.append('\n'.join(current_line))
                    in_line_def = False
                    current_line = []

print(f"Extracted {len(all_line_definitions)} line definitions")
print(f"Line names: {', '.join(all_line_names[:10])}... (showing first 10)")

# Generate the new DataService.swift
output = '''//
//  DataService.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//
//  UPDATED: 2026-01-14 with COMPLETE GTFS extraction for all Spanish Cercanías networks
//  Total: 39 Cercanías lines with 741 stops across 6 networks
//  Data source: GTFS (Hybrid: stop_times.txt + shapes.txt)
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

    // MARK: - Data Loading

    private func loadMockData() async {

        // ========================================
        // MADRID METRO (Mock data - to be replaced)
        // ========================================

        // Madrid Metro Line 1
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
            colorHex: "#2ca5dd",
            stops: line1Stops,
            city: "Madrid"
        )

        let line2 = Line(
            id: "line2",
            name: "L2",
            type: .metro,
            colorHex: "#e0292f",
            stops: [
                Stop(id: "stop_cuatro_caminos", name: "Cuatro Caminos", latitude: 40.4456, longitude: -3.7098, connectionLineIds: ["line1", "line6"]),
                Stop(id: "stop_goya", name: "Goya", latitude: 40.4265, longitude: -3.6768, connectionLineIds: []),
                Stop(id: "stop_retiro", name: "Retiro", latitude: 40.4120, longitude: -3.6830, connectionLineIds: []),
            ],
            city: "Madrid"
        )

        // ========================================
        // COMPLETE SPANISH CERCANÍAS NETWORKS
        // Source: GTFS extraction 2026-01-14
        // ========================================

'''

# Add all line definitions
for line_def in all_line_definitions:
    output += '\n' + line_def + '\n'

# Add the lines array
output += '''
        // Collect all lines
        lines = [
            // Madrid Metro (Mock - to be replaced)
            line1, line2,
            // All Spanish Cercanías (Complete GTFS extraction)
'''

for line_name in all_line_names:
    output += f'            {line_name},\n'

output += '''        ]

        // Collect all stops
        var allStops: [Stop] = []
        allStops += line1Stops
        for line in lines {
            allStops += line.stops
        }
        stops = allStops
    }

    private func generateMockArrivals(for stopId: String) -> [Arrival] {
        let now = Date()

        return [
            Arrival(
                id: UUID().uuidString,
                lineId: "madrid_c1",
                lineName: "C1",
                destination: "Aeropuerto T4",
                scheduledTime: now.addingTimeInterval(3 * 60),
                expectedTime: now.addingTimeInterval(3 * 60),
                platform: "1"
            ),
            Arrival(
                id: UUID().uuidString,
                lineId: "madrid_c3",
                lineName: "C3",
                destination: "Aranjuez",
                scheduledTime: now.addingTimeInterval(12 * 60),
                expectedTime: now.addingTimeInterval(12 * 60),
                platform: "3"
            ),
        ]
    }
}
'''

# Write the output
with open('/Users/juanmaciasgomez/Downloads/DataService_COMPLETE.swift', 'w', encoding='utf-8') as f:
    f.write(output)

print(f"✅ Generated DataService_COMPLETE.swift")
print(f"   Total line definitions: {len(all_line_definitions)}")
print(f"   File size: {len(output)} characters")
print(f"\nNow copy this to the actual DataService.swift location")
