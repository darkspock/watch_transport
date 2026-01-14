#!/usr/bin/env python3
import csv
from collections import defaultdict
from pathlib import Path

# Path to GTFS data
GTFS_PATH = Path("/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA")

# Networks to extract (skipping Sevilla 30T which is already complete)
NETWORKS = {
    "Madrid": {"prefix": "10T", "lines": ["C1", "C2", "C3", "C4a", "C4b", "C5", "C7", "C8a", "C8b", "C9", "C10"]},
    "Barcelona": {"prefix": "51T", "lines": ["R1", "R2", "R3", "R4", "R7", "R8", "R11", "R12", "R13", "R14", "R15", "R16", "R17"]},
    "Valencia": {"prefix": "40T", "lines": ["C1", "C2", "C3", "C4", "C5", "C6"]},
    "Bilbao": {"prefix": ["60T", "61T"], "lines": ["C1", "C2", "C3"]},
    "Málaga": {"prefix": "32T", "lines": ["C1", "C2"]},
}

def load_routes():
    """Load routes.txt and organize by network prefix"""
    routes = {}
    with open(GTFS_PATH / "routes.txt", "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            route_id = row["route_id"].strip()
            routes[route_id] = {
                "short_name": row["route_short_name"].strip(),
                "long_name": row["route_long_name"].strip(),
                "color": row["route_color"].strip(),
            }
    return routes

def load_stops():
    """Load stops.txt"""
    stops = {}
    with open(GTFS_PATH / "stops.txt", "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            stop_id = row["stop_id"].strip()
            stops[stop_id] = {
                "name": row["stop_name"].strip(),
                "lat": row["stop_lat"].strip(),
                "lon": row["stop_lon"].strip(),
            }
    return stops

def load_trips():
    """Load trips.txt and organize by route"""
    trips_by_route = defaultdict(list)
    with open(GTFS_PATH / "trips.txt", "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            route_id = row["route_id"].strip()
            trip_id = row["trip_id"].strip()
            trips_by_route[route_id].append(trip_id)
    return trips_by_route

def load_stop_times_for_trip(trip_id):
    """Load stop sequence for a specific trip"""
    stop_sequence = []
    with open(GTFS_PATH / "stop_times.txt", "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row["trip_id"].strip() == trip_id:
                stop_sequence.append({
                    "stop_id": row["stop_id"].strip(),
                    "sequence": int(row["stop_sequence"]),
                })
    return sorted(stop_sequence, key=lambda x: x["sequence"])

def get_longest_trip(route_id, trips_by_route):
    """Find the trip with the most stops for a given route"""
    if route_id not in trips_by_route:
        return None, []

    longest_trip = None
    longest_sequence = []

    for trip_id in trips_by_route[route_id]:
        sequence = load_stop_times_for_trip(trip_id)
        if len(sequence) > len(longest_sequence):
            longest_trip = trip_id
            longest_sequence = sequence

    return longest_trip, longest_sequence

def find_connections(stop_id, all_line_stops):
    """Find which lines connect at a given stop"""
    connections = []
    for line_name, stops_in_line in all_line_stops.items():
        if stop_id in stops_in_line:
            connections.append(line_name)
    return sorted(connections)

def extract_network(network_name, network_config, routes, stops, trips_by_route):
    """Extract all data for a network"""
    output = []
    output.append(f"## {network_name}\n")

    # Get prefix(es)
    prefixes = network_config["prefix"]
    if isinstance(prefixes, str):
        prefixes = [prefixes]

    # Organize routes by line
    routes_by_line = defaultdict(list)
    for route_id, route_data in routes.items():
        # Check if route matches any prefix
        if any(route_id.startswith(prefix) for prefix in prefixes):
            line_name = route_data["short_name"]
            if line_name in network_config["lines"]:
                routes_by_line[line_name].append((route_id, route_data))

    # First pass: collect all stops for each line to identify connections
    all_line_stops = {}
    line_data = {}

    for line_name in network_config["lines"]:
        if line_name not in routes_by_line:
            continue

        # Find the route with the longest trip
        longest_route = None
        longest_trip = None
        longest_sequence = []

        for route_id, route_data in routes_by_line[line_name]:
            trip_id, sequence = get_longest_trip(route_id, trips_by_route)
            if len(sequence) > len(longest_sequence):
                longest_route = route_id
                longest_trip = trip_id
                longest_sequence = sequence
                color = route_data["color"]

        if longest_sequence:
            stop_ids = [s["stop_id"] for s in longest_sequence]
            all_line_stops[line_name] = set(stop_ids)
            line_data[line_name] = {
                "route_id": longest_route,
                "trip_id": longest_trip,
                "sequence": longest_sequence,
                "color": color,
            }

    # Second pass: generate output with connections
    for line_name in network_config["lines"]:
        if line_name not in line_data:
            continue

        data = line_data[line_name]
        output.append(f"### Line {line_name} (Color: #{data['color']})")
        output.append(f"**Route ID:** {data['route_id']}")
        output.append(f"**Stops ({len(data['sequence'])} stops):**")

        for i, stop_data in enumerate(data['sequence'], 1):
            stop_id = stop_data['stop_id']
            if stop_id in stops:
                stop_info = stops[stop_id]
                connections = find_connections(stop_id, all_line_stops)
                # Remove current line from connections
                connections = [c for c in connections if c != line_name]
                conn_str = f" - Connections: [{', '.join(connections)}]" if connections else ""
                output.append(
                    f"{i}. {stop_info['name']} (stop_id: {stop_id}, "
                    f"lat: {stop_info['lat']}, lon: {stop_info['lon']}){conn_str}"
                )
            else:
                output.append(f"{i}. Unknown stop (stop_id: {stop_id})")

        output.append("")

    return "\n".join(output)

def main():
    print("Loading GTFS data...")
    routes = load_routes()
    stops = load_stops()
    trips_by_route = load_trips()

    print("Extracting networks...")
    output = ["# Complete Cercanías Networks Data\n"]
    output.append("**Networks:** Madrid, Barcelona, Valencia, Bilbao, Málaga\n")
    output.append("**Note:** Sevilla (30T) already complete and excluded from this extraction.\n")

    for network_name, network_config in NETWORKS.items():
        print(f"Processing {network_name}...")
        network_output = extract_network(
            network_name, network_config, routes, stops, trips_by_route
        )
        output.append(network_output)

    # Write output
    output_path = "/Users/juanmaciasgomez/Downloads/ALL_CERCANIAS_NETWORKS.md"
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(output))

    print(f"\nExtraction complete! Output saved to: {output_path}")

if __name__ == "__main__":
    main()
