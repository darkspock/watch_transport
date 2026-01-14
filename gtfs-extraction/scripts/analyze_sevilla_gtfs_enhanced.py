#!/usr/bin/env python3
import csv
from collections import defaultdict

# Path to GTFS files
base_path = "/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/"

print("Loading GTFS data...")

# Read ALL stops (not just 51xxx) so we can see complete routes
all_stops = {}
with open(base_path + "stops.txt", 'r', encoding='utf-8') as f:
    header = f.readline().strip()
    for line in f:
        parts = line.strip().split(',')
        if len(parts) >= 2:
            stop_id = parts[0].strip()
            stop_name = parts[1].strip()
            all_stops[stop_id] = stop_name

# Identify Sevilla area stops (51xxx)
sevilla_stop_ids = {k for k in all_stops.keys() if k.startswith('51')}
print(f"Found {len(sevilla_stop_ids)} Sevilla stops (51xxx)")

# Read routes (filter for 30T - Sevilla area)
sevilla_routes = {}
with open(base_path + "routes.txt", 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        if route_id.startswith('30T'):
            route_short = row['route_short_name'].strip()
            route_long = row['route_long_name'].strip()
            if route_short not in sevilla_routes:
                sevilla_routes[route_short] = {
                    'color': row['route_color'].strip(),
                    'route_ids': [],
                    'descriptions': set()
                }
            sevilla_routes[route_short]['route_ids'].append(route_id)
            if route_long:
                sevilla_routes[route_short]['descriptions'].add(route_long)

print(f"Found Sevilla routes: {sorted(sevilla_routes.keys())}")

# Read trips
print("Loading trips...")
route_trips = defaultdict(list)
with open(base_path + "trips.txt", 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        if route_id.startswith('30T'):
            trip_id = row['trip_id'].strip()
            route_trips[route_id].append(trip_id)

# Build set of all Sevilla trip IDs for faster lookup
all_sevilla_trip_ids = set()
for trips in route_trips.values():
    all_sevilla_trip_ids.update(trips)

print(f"Found {len(all_sevilla_trip_ids)} trips for Sevilla routes")

# Read stop_times - get ALL stops for each trip to see full routes
print("Loading stop_times (this may take a moment)...")
trip_stops = defaultdict(list)
with open(base_path + "stop_times.txt", 'r', encoding='utf-8') as f:
    header_line = f.readline().strip()
    headers = [h.strip() for h in header_line.split(',')]

    trip_id_idx = headers.index('trip_id')
    stop_id_idx = headers.index('stop_id')
    stop_seq_idx = headers.index('stop_sequence')

    for line in f:
        parts = [p.strip() for p in line.strip().split(',')]
        if len(parts) > max(trip_id_idx, stop_id_idx, stop_seq_idx):
            trip_id = parts[trip_id_idx]
            if trip_id in all_sevilla_trip_ids:
                stop_id = parts[stop_id_idx]
                trip_stops[trip_id].append({
                    'stop_id': stop_id,
                    'stop_sequence': int(parts[stop_seq_idx]),
                    'stop_name': all_stops.get(stop_id, f"Unknown ({stop_id})"),
                    'is_sevilla': stop_id in sevilla_stop_ids
                })

print(f"Loaded stop sequences for {len(trip_stops)} trips")

# Sort stops by sequence
for trip_id in trip_stops:
    trip_stops[trip_id].sort(key=lambda x: x['stop_sequence'])

# For each route_id, find the trip with most stops
print("Analyzing routes...")
route_best_trips = {}
for route_short, route_data in sevilla_routes.items():
    route_best_trips[route_short] = {}

    for route_id in route_data['route_ids']:
        max_stops = []
        max_trip_id = None

        for trip_id in route_trips[route_id]:
            if trip_id in trip_stops and len(trip_stops[trip_id]) > len(max_stops):
                max_stops = trip_stops[trip_id]
                max_trip_id = trip_id

        if max_trip_id:
            route_best_trips[route_short][route_id] = {
                'trip_id': max_trip_id,
                'stops': max_stops
            }

# Find connections at each Sevilla stop
stop_routes = defaultdict(set)
for route_short, route_trips_data in route_best_trips.items():
    for route_id, trip_data in route_trips_data.items():
        for stop in trip_data['stops']:
            if stop['is_sevilla']:
                stop_routes[stop['stop_id']].add(route_short)

# Output results
print("\n" + "="*80)
print("RENFE CERCANÍAS SEVILLA - GTFS ANALYSIS")
print("="*80)

for route_short in sorted(sevilla_routes.keys()):
    route_data = sevilla_routes[route_short]
    print(f"\n{'='*80}")
    print(f"Line {route_short} (color: #{route_data['color']})")

    # Show route descriptions if available
    if route_data['descriptions']:
        descriptions = sorted(route_data['descriptions'])
        for desc in descriptions:
            if desc.strip():
                print(f"Route: {desc}")

    print(f"{'='*80}")

    # Merge stops from all directions, preserving order from first occurrence
    seen_stops = {}
    all_stops_ordered = []

    for route_id in sorted(route_data['route_ids']):
        if route_id in route_best_trips[route_short]:
            trip_data = route_best_trips[route_short][route_id]

            # Only add Sevilla stops (51xxx) to final list
            for stop in trip_data['stops']:
                if stop['is_sevilla'] and stop['stop_id'] not in seen_stops:
                    seen_stops[stop['stop_id']] = True
                    all_stops_ordered.append(stop)

    if all_stops_ordered:
        print(f"\nStops in Sevilla area (51xxx codes):")
        for idx, stop in enumerate(all_stops_ordered, 1):
            connections = sorted(stop_routes[stop['stop_id']] - {route_short})
            connections_str = ', '.join(connections) if connections else 'None'
            print(f"{idx}. {stop['stop_name']} (stop_id: {stop['stop_id']}) - Connections: [{connections_str}]")

        # Show sample full route with all stops
        print(f"\n  Sample complete route (showing all stops):")
        sample_route_id = sorted(route_data['route_ids'])[0]
        if sample_route_id in route_best_trips[route_short]:
            sample_trip = route_best_trips[route_short][sample_route_id]
            print(f"  Route {sample_route_id}:")
            for idx, stop in enumerate(sample_trip['stops'], 1):
                marker = " [SEVILLA]" if stop['is_sevilla'] else ""
                print(f"    {idx}. {stop['stop_name']} ({stop['stop_id']}){marker}")
    else:
        print("\nNo stops found in Sevilla area (51xxx codes)")

print("\n" + "="*80)
print("SUMMARY - CONNECTIONS AT EACH STOP")
print("="*80)

# Create summary of all Sevilla stops with connections
sevilla_stops_with_connections = {}
for stop_id in sorted(sevilla_stop_ids):
    if stop_id in stop_routes:
        sevilla_stops_with_connections[stop_id] = {
            'name': all_stops[stop_id],
            'lines': sorted(stop_routes[stop_id])
        }

for stop_id in sorted(sevilla_stops_with_connections.keys()):
    info = sevilla_stops_with_connections[stop_id]
    lines_str = ', '.join(info['lines'])
    print(f"{info['name']} ({stop_id}): {lines_str}")

print("\n" + "="*80)
print("ANALYSIS COMPLETE")
print("="*80)
