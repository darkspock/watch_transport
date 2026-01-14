//
//  LineDetailView.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//  Shows all stops for a specific line
//

import SwiftUI

struct LineDetailView: View {
    let line: Line
    let dataService: DataService

    var lineColor: Color {
        Color(hex: line.colorHex) ?? .blue
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                // Line header
                HStack(spacing: 8) {
                    Text(line.name)
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(lineColor)
                        )

                    VStack(alignment: .leading, spacing: 2) {
                        Text(line.type.rawValue.capitalized)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("\(line.stops.count) stops")
                            .font(.caption2)
                            .foregroundStyle(.tertiary)
                    }

                    Spacer()
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 4)

                // All stops
                VStack(spacing: 0) {
                    ForEach(Array(line.stops.enumerated()), id: \.element.id) { index, stop in
                        StopRow(
                            stop: stop,
                            isFirst: index == 0,
                            isLast: index == line.stops.count - 1,
                            lineColor: lineColor,
                            dataService: dataService
                        )
                    }
                }
            }
            .padding(.vertical, 12)
        }
        .navigationTitle(line.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Stop Row

struct StopRow: View {
    let stop: Stop
    let isFirst: Bool
    let isLast: Bool
    let lineColor: Color
    let dataService: DataService

    @State private var showArrivals = false

    var hasConnections: Bool {
        !stop.connectionLineIds.isEmpty
    }

    var body: some View {
        VStack(spacing: 0) {
            // Connection line (vertical)
            if !isFirst {
                Rectangle()
                    .fill(lineColor)
                    .frame(width: 3, height: 12)
            }

            // Stop circle and info
            HStack(alignment: .center, spacing: 10) {
                // Circle indicator
                Circle()
                    .fill(lineColor)
                    .frame(width: 12, height: 12)
                    .overlay(
                        Circle()
                            .stroke(.background, lineWidth: 2)
                    )

                // Stop name
                VStack(alignment: .leading, spacing: 2) {
                    Text(stop.name)
                        .font(.subheadline)
                        .fontWeight(isFirst || isLast ? .bold : .regular)

                    // Connection badges
                    if hasConnections {
                        HStack(spacing: 4) {
                            ForEach(stop.connectionLineIds, id: \.self) { connectionId in
                                if let connectionLine = dataService.getLine(by: connectionId) {
                                    Text(connectionLine.name)
                                        .font(.system(size: 9, weight: .bold))
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 4)
                                        .padding(.vertical, 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 3)
                                                .fill(Color(hex: connectionLine.colorHex) ?? .gray)
                                        )
                                }
                            }
                        }
                    }
                }

                Spacer()

                // Tap to view arrivals indicator
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .background(.regularMaterial)
            .cornerRadius(8)

            // Connection line (vertical)
            if !isLast {
                Rectangle()
                    .fill(lineColor)
                    .frame(width: 3, height: 12)
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    NavigationStack {
        LineDetailView(
            line: Line(
                id: "line1",
                name: "L1",
                type: .metro,
                colorHex: "#2ca5dd",
                stops: [
                    Stop(id: "stop1", name: "Pinar de Chamartín", latitude: 40.4595, longitude: -3.6802, connectionLineIds: []),
                    Stop(id: "stop2", name: "Chamartín", latitude: 40.4473, longitude: -3.6802, connectionLineIds: ["line10"]),
                    Stop(id: "stop3", name: "Sol", latitude: 40.4169, longitude: -3.7033, connectionLineIds: ["line2", "line3"])
                ],
                city: "Madrid"
            ),
            dataService: DataService()
        )
    }
}
