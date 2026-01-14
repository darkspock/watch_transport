//
//  ContentView.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var locationService = LocationService()
    @State private var dataService = DataService()
    @State private var arrivals: [Arrival] = []
    @State private var nearestStop: Stop?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    if dataService.isLoading {
                        ProgressView("Loading...")
                            .padding()
                    } else if let stop = nearestStop {
                        // Stop info header
                        VStack(spacing: 4) {
                            Text(stop.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            if let location = locationService.currentLocation {
                                Text(stop.formattedDistance(from: location))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.top, 8)

                        Divider()
                            .padding(.horizontal)

                        // Arrivals list
                        if arrivals.isEmpty {
                            Text("No arrivals available")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .padding()
                        } else {
                            ForEach(arrivals) { arrival in
                                if let line = dataService.getLine(by: arrival.lineId) {
                                    ArrivalCard(arrival: arrival, lineColor: line.color)
                                } else {
                                    ArrivalCard(arrival: arrival, lineColor: .blue)
                                }
                            }
                        }
                    } else {
                        // No location or stop found
                        VStack(spacing: 12) {
                            Image(systemName: "location.slash")
                                .font(.largeTitle)
                                .foregroundStyle(.secondary)

                            Text("No nearby stops")
                                .font(.headline)

                            Text("Make sure location services are enabled")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)

                            Button("Retry") {
                                Task {
                                    await loadData()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding()
                    }
                }
                .padding(.horizontal, 8)
            }
            .navigationTitle("WatchTrans")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await loadData()
        }
        .refreshable {
            await loadData()
        }
    }

    // MARK: - Data Loading

    private func loadData() async {
        // Request location permission if needed
        if locationService.authorizationStatus == .notDetermined {
            locationService.requestPermission()
        }

        // Start location updates
        locationService.startUpdating()

        // Wait a moment for location to be available
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second

        // Fetch transport data
        await dataService.fetchTransportData()

        // Find nearest stop
        if let nearest = locationService.findNearestStop(from: dataService.stops) {
            nearestStop = nearest

            // Fetch arrivals for nearest stop
            arrivals = await dataService.fetchArrivals(for: nearest.id)
        }
    }
}

#Preview {
    ContentView()
}
