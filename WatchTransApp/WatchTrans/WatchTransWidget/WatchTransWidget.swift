//
//  WatchTransWidget.swift
//  WatchTransWidget
//
//  Created by Juan Macias Gomez on 14/1/26.
//

import WidgetKit
import SwiftUI

// MARK: - Timeline Entry

struct ArrivalEntry: TimelineEntry {
    let date: Date
    let lineName: String
    let destination: String
    let minutesUntilArrival: Int
    let isDelayed: Bool
    let lineColor: String // Hex color
}

// MARK: - Timeline Provider

struct ArrivalProvider: TimelineProvider {
    func placeholder(in context: Context) -> ArrivalEntry {
        ArrivalEntry(
            date: Date(),
            lineName: "C3",
            destination: "Aranjuez",
            minutesUntilArrival: 5,
            isDelayed: false,
            lineColor: "#FF6B35"
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (ArrivalEntry) -> ()) {
        let entry = ArrivalEntry(
            date: Date(),
            lineName: "C3",
            destination: "Aranjuez",
            minutesUntilArrival: 5,
            isDelayed: false,
            lineColor: "#FF6B35"
        )
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ArrivalEntry] = []

        // Generate timeline with mock data
        // In real implementation, this would fetch from shared data or API
        let currentDate = Date()

        // Mock arrivals at 5, 12, and 20 minutes
        let mockArrivals = [
            (minutes: 5, line: "C3", dest: "Aranjuez", color: "#FF6B35", delayed: false),
            (minutes: 12, line: "L1", dest: "Valdecarros", color: "#1E90FF", delayed: true),
            (minutes: 20, line: "C4", dest: "Parla", color: "#FFB612", delayed: false)
        ]

        for (index, arrival) in mockArrivals.enumerated() {
            if let entryDate = Calendar.current.date(byAdding: .minute, value: index * 5, to: currentDate) {
                let entry = ArrivalEntry(
                    date: entryDate,
                    lineName: arrival.line,
                    destination: arrival.dest,
                    minutesUntilArrival: arrival.minutes - (index * 5),
                    isDelayed: arrival.delayed,
                    lineColor: arrival.color
                )
                entries.append(entry)
            }
        }

        // Update every 5 minutes
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - Complication View

struct WatchTransWidgetEntryView: View {
    var entry: ArrivalProvider.Entry

    var lineColor: Color {
        Color(hex: entry.lineColor) ?? .blue
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            // Line and destination
            HStack(spacing: 4) {
                Text(entry.lineName)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(lineColor)

                Image(systemName: "arrow.right")
                    .font(.system(size: 10))
                    .foregroundStyle(.secondary)

                Text(entry.destination)
                    .font(.system(size: 12))
                    .lineLimit(1)
            }

            // Time and progress
            HStack(spacing: 4) {
                // Progress bar
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        // Background
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.tertiary)
                            .frame(height: 4)

                        // Progress
                        RoundedRectangle(cornerRadius: 2)
                            .fill(entry.isDelayed ? .orange : .green)
                            .frame(
                                width: geometry.size.width * progressValue,
                                height: 4
                            )
                    }
                }
                .frame(height: 4)

                // Time text
                Text(timeText)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.primary)
                    .frame(minWidth: 35, alignment: .trailing)
            }

            // Delay indicator
            if entry.isDelayed {
                HStack(spacing: 2) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 8))
                        .foregroundStyle(.orange)

                    Text("Delayed")
                        .font(.system(size: 9))
                        .foregroundStyle(.secondary)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var timeText: String {
        if entry.minutesUntilArrival == 0 {
            return "Now"
        } else if entry.minutesUntilArrival == 1 {
            return "1 min"
        } else {
            return "\(entry.minutesUntilArrival)m"
        }
    }

    var progressValue: Double {
        let minutes = Double(entry.minutesUntilArrival)
        let maxMinutes = 30.0
        return max(0, min(1.0, 1.0 - (minutes / maxMinutes)))
    }
}

// MARK: - Widget Configuration

struct WatchTransWidget: Widget {
    let kind: String = "WatchTransWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ArrivalProvider()) { entry in
            WatchTransWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Next Arrival")
        .description("See your next train or metro arrival")
        .supportedFamilies([.accessoryRectangular])
    }
}

// MARK: - Color Extension

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

// MARK: - Preview

#Preview(as: .accessoryRectangular) {
    WatchTransWidget()
} timeline: {
    ArrivalEntry(
        date: .now,
        lineName: "C3",
        destination: "Aranjuez",
        minutesUntilArrival: 5,
        isDelayed: false,
        lineColor: "#FF6B35"
    )
    ArrivalEntry(
        date: .now,
        lineName: "L1",
        destination: "Valdecarros",
        minutesUntilArrival: 2,
        isDelayed: true,
        lineColor: "#1E90FF"
    )
}
