//
//  ArrivalCard.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//

import SwiftUI

struct ArrivalCard: View {
    let arrival: Arrival
    let lineColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Line and destination
            HStack {
                Text(arrival.lineName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(lineColor)

                Image(systemName: "arrow.right")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(arrival.destination)
                    .font(.subheadline)
                    .lineLimit(1)
            }

            // Progress bar and time
            HStack {
                ProgressView(value: arrival.progressValue)
                    .tint(arrival.isDelayed ? .orange : .green)
                    .frame(height: 4)

                Text(arrival.arrivalTimeString)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
            }

            // Delay indicator
            if arrival.isDelayed {
                HStack(spacing: 4) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.caption2)
                        .foregroundStyle(.orange)

                    Text("+\(arrival.delayMinutes) min delay")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(.regularMaterial)
        .cornerRadius(12)
    }
}

#Preview {
    let mockArrival = Arrival(
        id: "1",
        lineId: "c3",
        lineName: "C3",
        destination: "Aranjuez",
        scheduledTime: Date().addingTimeInterval(5 * 60),
        expectedTime: Date().addingTimeInterval(12 * 60),
        platform: "1"
    )

    return ArrivalCard(arrival: mockArrival, lineColor: .blue)
        .padding()
}
