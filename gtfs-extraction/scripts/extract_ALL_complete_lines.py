#!/usr/bin/env python3
"""
Complete GTFS extraction for ALL Spanish Cercanías networks
Extracts full stop sequences for every line
"""
import csv
from collections import defaultdict

GTFS_PATH = '/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/'

print("Loading GTFS data...")

# Load all stops
stops = {}
with open(GTFS_PATH + 'stops.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        stops[row['stop_id'].strip()] = {
            'name': row['stop_name'].strip(),
            'lat': float(row['stop_lat'].strip()),
            'lon': float(row['stop_lon'].strip())
        }

print(f"Loaded {len(stops)} stops")

# Load routes
routes = {}
with open(GTFS_PATH + 'routes.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        routes[route_id] = {
            'line_name': row['route_short_name'].strip(),
            'route_desc': row['route_long_name'].strip(),
            'color': row['route_color'].strip()
        }

print(f"Loaded {len(routes)} routes")

# Load trips
trips_by_route = defaultdict(list)
with open(GTFS_PATH + 'trips.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        trip_id = row['trip_id'].strip()
        trips_by_route[route_id].append(trip_id)

print(f"Loaded trips for {len(trips_by_route)} routes")

def get_trip_stops(trip_id):
    """Get all stops for a trip in order"""
    trip_stops = []
    with open(GTFS_PATH + 'stop_times.txt', 'r', encoding='utf-8') as f:
        for line in f:
            if line.startswith(trip_id + ','):
                parts = line.strip().split(',')
                if len(parts) >= 5:
                    trip_stops.append({
                        'stop_id': parts[3].strip(),
                        'sequence': int(parts[4].strip())
                    })
    trip_stops.sort(key=lambda x: x['sequence'])
    return trip_stops

def find_best_trip(route_id, max_samples=50):
    """Find trip with most stops for a route"""
    trips = trips_by_route.get(route_id, [])
    if not trips:
        return None, []

    # Sample trips to find the longest
    sample_size = min(len(trips), max_samples)
    sample_trips = trips[::max(1, len(trips) // sample_size)]

    best_trip = None
    best_stops = []
    max_stops = 0

    for trip_id in sample_trips:
        trip_stops = get_trip_stops(trip_id)
        if len(trip_stops) > max_stops:
            max_stops = len(trip_stops)
            best_trip = trip_id
            best_stops = trip_stops

    return best_trip, best_stops

def extract_network(prefix, network_name):
    """Extract all lines for a network"""
    print(f"\n{'='*100}")
    print(f"EXTRACTING: {network_name}")
    print(f"{'='*100}\n")

    network_routes = {r_id: r_data for r_id, r_data in routes.items() if r_id.startswith(prefix)}

    # Group by line name
    lines = defaultdict(list)
    for route_id, route_data in network_routes.items():
        line_name = route_data['line_name']
        lines[line_name].append((route_id, route_data))

    results = {}

    for line_name in sorted(lines.keys()):
        print(f"\n--- LINE {line_name} ---")

        # Get the first direction route (usually the longer one)
        route_id, route_data = lines[line_name][0]

        trip_id, trip_stops = find_best_trip(route_id)

        if not trip_stops:
            print(f"  WARNING: No stops found for {line_name}")
            continue

        print(f"  Route: {route_data['route_desc']}")
        print(f"  Color: #{route_data['color']}")
        print(f"  Stops: {len(trip_stops)}")
        print(f"  Sample trip: {trip_id}")

        # Get stop details
        stop_list = []
        for stop_data in trip_stops:
            stop_id = stop_data['stop_id']
            if stop_id in stops:
                stop_info = stops[stop_id]
                stop_list.append({
                    'id': stop_id,
                    'name': stop_info['name'],
                    'lat': stop_info['lat'],
                    'lon': stop_info['lon']
                })

        results[line_name] = {
            'color': route_data['color'],
            'stops': stop_list,
            'route_desc': route_data['route_desc']
        }

        # Print first and last stops
        if stop_list:
            print(f"  First: {stop_list[0]['name']}")
            print(f"  Last: {stop_list[-1]['name']}")

    return results

# Extract all networks
print("\n" + "="*100)
print("STARTING FULL EXTRACTION")
print("="*100)

networks = [
    ('10T', 'MADRID'),
    ('30T', 'SEVILLA'),
    ('32T', 'MÁLAGA'),
    ('40T', 'VALENCIA'),
    ('51T', 'BARCELONA'),
    ('60T', 'BILBAO-BIZKAIA'),
    ('61T', 'SAN SEBASTIÁN-GIPUZKOA')
]

all_results = {}

for prefix, name in networks:
    all_results[name] = extract_network(prefix, name)

# Summary
print("\n" + "="*100)
print("EXTRACTION COMPLETE - SUMMARY")
print("="*100)

for network_name, lines in all_results.items():
    print(f"\n{network_name}: {len(lines)} lines")
    for line_name, line_data in sorted(lines.items()):
        print(f"  {line_name}: {len(line_data['stops'])} stops")

print("\n" + "="*100)
print(f"TOTAL LINES EXTRACTED: {sum(len(lines) for lines in all_results.values())}")
print("="*100)

# Save results to file for processing
import json
with open('/Users/juanmaciasgomez/Downloads/complete_extraction_results.json', 'w', encoding='utf-8') as f:
    json.dump(all_results, f, indent=2, ensure_ascii=False)

print("\nResults saved to: complete_extraction_results.json")
