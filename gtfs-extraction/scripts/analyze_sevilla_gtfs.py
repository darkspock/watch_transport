#!/usr/bin/env python3
import csv
from collections import defaultdict

# Path to GTFS files
base_path = "/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/"

print("Loading GTFS data...")

# Read stops
stops = {}
with open(base_path + "stops.txt", 'r', encoding='utf-8') as f:
    # Read and clean header
    header = f.readline().strip()
    fields = [field.strip() for field in header.split(',')]

    for line in f:
        parts = line.strip().split(',')
        if len(parts) >= 2:
            stop_id = parts[0].strip()
            stop_name = parts[1].strip()
            stops[stop_id] = stop_name

# Filter Sevilla stops (51xxx)
sevilla_stops = {k: v for k, v in stops.items() if k.startswith('51')}
print(f"Found {len(sevilla_stops)} Sevilla stops (51xxx)")

# Read routes (filter for 30T - Sevilla area)
sevilla_routes = {}
with open(base_path + "routes.txt", 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        if route_id.startswith('30T'):
            route_short = row['route_short_name'].strip()
            if route_short not in sevilla_routes:
                sevilla_routes[route_short] = {
                    'color': row['route_color'].strip(),
                    'route_ids': []
                }
            sevilla_routes[route_short]['route_ids'].append(route_id)

print(f"Found Sevilla routes: {sorted(sevilla_routes.keys())}")

# Read trips to map route_id to trip_id
print("Loading trips...")
route_trips = defaultdict(list)
with open(base_path + "trips.txt", 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        if route_id.startswith('30T'):
            trip_id = row['trip_id'].strip()
            route_trips[route_id].append(trip_id)

trip_count = sum(len(trips) for trips in route_trips.values())
print(f"Found {trip_count} trips for Sevilla routes")

# Build set of all Sevilla trip IDs for faster lookup
all_sevilla_trip_ids = set()
for trips in route_trips.values():
    all_sevilla_trip_ids.update(trips)

# Read stop_times to get stop sequences
print("Loading stop_times (this may take a moment)...")
trip_stops = defaultdict(list)
with open(base_path + "stop_times.txt", 'r', encoding='utf-8') as f:
    # Read header and strip whitespace
    header_line = f.readline().strip()
    headers = [h.strip() for h in header_line.split(',')]

    # Find column indices
    trip_id_idx = headers.index('trip_id')
    stop_id_idx = headers.index('stop_id')
    stop_seq_idx = headers.index('stop_sequence')

    for line in f:
        parts = [p.strip() for p in line.strip().split(',')]
        if len(parts) > max(trip_id_idx, stop_id_idx, stop_seq_idx):
            trip_id = parts[trip_id_idx]
            # Only process trips that belong to Sevilla routes
            if trip_id in all_sevilla_trip_ids:
                stop_id = parts[stop_id_idx]
                # Only include Sevilla stops
                if stop_id in sevilla_stops:
                    trip_stops[trip_id].append({
                        'stop_id': stop_id,
                        'stop_sequence': int(parts[stop_seq_idx]),
                        'stop_name': sevilla_stops[stop_id]
                    })

print(f"Loaded stop sequences for {len(trip_stops)} trips")

# Sort stops by sequence for each trip
for trip_id in trip_stops:
    trip_stops[trip_id].sort(key=lambda x: x['stop_sequence'])

# For each route, find the trip with the most stops (most complete route)
print("Analyzing routes...")
route_stop_sequences = {}
for route_short, route_data in sevilla_routes.items():
    route_stop_sequences[route_short] = {}

    for route_id in route_data['route_ids']:
        max_stops = []
        max_trip_id = None

        for trip_id in route_trips[route_id]:
            if trip_id in trip_stops and len(trip_stops[trip_id]) > len(max_stops):
                max_stops = trip_stops[trip_id]
                max_trip_id = trip_id

        if max_trip_id:
            route_stop_sequences[route_short][route_id] = {
                'trip_id': max_trip_id,
                'stops': max_stops
            }

# Find connections at each stop
stop_routes = defaultdict(set)
for route_short, route_data in route_stop_sequences.items():
    for route_id, trip_data in route_data.items():
        for stop in trip_data['stops']:
            stop_routes[stop['stop_id']].add(route_short)

# Output results
print("\n" + "="*80)
print("SEVILLA CERCANÍAS ANALYSIS")
print("="*80)

for route_short in sorted(sevilla_routes.keys()):
    route_data = sevilla_routes[route_short]
    print(f"\n{'='*80}")
    print(f"Line {route_short} (color: #{route_data['color']})")
    print(f"{'='*80}")

    # Collect all unique stops across all route_ids for this line
    all_stops_dict = {}  # Use dict to track unique stops while preserving a typical order

    for route_id in route_data['route_ids']:
        if route_id in route_stop_sequences[route_short]:
            trip_data = route_stop_sequences[route_short][route_id]
            for stop in trip_data['stops']:
                if stop['stop_id'] not in all_stops_dict:
                    all_stops_dict[stop['stop_id']] = stop

    all_stops = list(all_stops_dict.values())

    if all_stops:
        print(f"\nStops in order:")
        for idx, stop in enumerate(all_stops, 1):
            # Find connections (other lines that stop here)
            connections = sorted(stop_routes[stop['stop_id']] - {route_short})
            connections_str = ', '.join(connections) if connections else 'None'
            print(f"{idx}. {stop['stop_name']} (stop_id: {stop['stop_id']}) - Connections: [{connections_str}]")
    else:
        print("\nNo stops found for this route in the Sevilla area (51xxx)")

    # Show different route variations
    if len(route_stop_sequences[route_short]) > 1:
        print(f"\n  Note: This line has {len(route_stop_sequences[route_short])} route variations:")
        for route_id in route_data['route_ids']:
            if route_id in route_stop_sequences[route_short]:
                trip_data = route_stop_sequences[route_short][route_id]
                print(f"    - {route_id}: {len(trip_data['stops'])} stops")

print("\n" + "="*80)
print("ANALYSIS COMPLETE")
print("="*80)
