#!/usr/bin/env python3
"""
Hybrid extraction: Use stop_times where available, shapes for ordering,
and increase tolerance for newer stations
"""
import csv
import math
from collections import defaultdict
import json

GTFS_PATH = '/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/'

print("Loading GTFS data...")

# Load stops
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
route_shapes = defaultdict(set)
with open(GTFS_PATH + 'trips.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    reader.fieldnames = [name.strip() for name in reader.fieldnames]
    for row in reader:
        route_id = row['route_id'].strip()
        trip_id = row['trip_id'].strip()
        shape_id = row['shape_id'].strip()
        trips_by_route[route_id].append(trip_id)
        if shape_id:
            route_shapes[route_id].add(shape_id)

print(f"Loaded trips for {len(trips_by_route)} routes")

# Load shapes
shapes = defaultdict(list)
with open(GTFS_PATH + 'shapes.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    reader.fieldnames = [name.strip() for name in reader.fieldnames]
    for row in reader:
        shape_id = row['shape_id'].strip()
        lat = float(row['shape_pt_lat'].strip())
        lon = float(row['shape_pt_lon'].strip())
        seq = int(row['shape_pt_sequence'].strip())
        shapes[shape_id].append((seq, lat, lon))

for shape_id in shapes:
    shapes[shape_id].sort(key=lambda x: x[0])

print(f"Loaded {len(shapes)} shapes")

def distance(lat1, lon1, lat2, lon2):
    """Calculate distance between two points (Haversine)"""
    R = 6371
    lat1, lon1, lat2, lon2 = map(math.radians, [lat1, lon1, lat2, lon2])
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = math.sin(dlat/2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon/2)**2
    c = 2 * math.asin(math.sqrt(a))
    return R * c

def point_to_line_distance(stop_lat, stop_lon, shape_points):
    """Find minimum distance from stop to any point on shape path"""
    min_dist = float('inf')
    closest_idx = 0

    for i, (seq, lat, lon) in enumerate(shape_points):
        dist = distance(stop_lat, stop_lon, lat, lon)
        if dist < min_dist:
            min_dist = dist
            closest_idx = i

    return min_dist, closest_idx

def get_trip_stops(trip_id):
    """Get all stops for a trip in order from stop_times.txt"""
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

def find_best_trip_with_stops(route_id, max_samples=50):
    """Find trip with most stops for a route (if stop_times available)"""
    trips = trips_by_route.get(route_id, [])
    if not trips:
        return None, []

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

def find_stops_for_route_by_shape(route_id, max_distance_km=1.0):
    """Find stops along route using shape matching (fallback method)"""
    shape_ids = route_shapes.get(route_id, set())
    if not shape_ids:
        return []

    shape_id = list(shape_ids)[0]
    shape_points = shapes.get(shape_id, [])

    if not shape_points:
        return []

    stops_on_route = []
    for stop_id, stop_data in stops.items():
        dist, idx = point_to_line_distance(stop_data['lat'], stop_data['lon'], shape_points)

        if dist <= max_distance_km:
            stops_on_route.append({
                'stop_id': stop_id,
                'name': stop_data['name'],
                'lat': stop_data['lat'],
                'lon': stop_data['lon'],
                'shape_idx': idx,
                'distance_to_shape': dist
            })

    stops_on_route.sort(key=lambda x: x['shape_idx'])
    return stops_on_route

def extract_network(prefix, network_name):
    """Extract all lines for a network"""
    print(f"\n{'='*100}")
    print(f"EXTRACTING: {network_name}")
    print(f"{'='*100}\n")

    network_routes = {r_id: r_data for r_id, r_data in routes.items() if r_id.startswith(prefix)}

    lines = defaultdict(list)
    for route_id, route_data in network_routes.items():
        line_name = route_data['line_name']
        lines[line_name].append((route_id, route_data))

    results = {}

    for line_name in sorted(lines.keys()):
        print(f"\n--- LINE {line_name} ---")

        route_id, route_data = lines[line_name][0]

        # Try stop_times first
        trip_id, trip_stops = find_best_trip_with_stops(route_id)

        if trip_stops:
            print(f"  ✓ Using stop_times.txt")
            print(f"  Route: {route_data['route_desc']}")
            print(f"  Color: #{route_data['color']}")
            print(f"  Stops: {len(trip_stops)}")
            print(f"  Sample trip: {trip_id}")

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

        else:
            # Fallback to shape-based matching
            print(f"  ⚠ Using shape matching (no stop_times)")
            route_stops = find_stops_for_route_by_shape(route_id, max_distance_km=1.0)

            if not route_stops:
                print(f"  WARNING: No stops found for {line_name}")
                continue

            print(f"  Route: {route_data['route_desc']}")
            print(f"  Color: #{route_data['color']}")
            print(f"  Stops: {len(route_stops)}")

            stop_list = []
            for stop_data in route_stops:
                stop_list.append({
                    'id': stop_data['stop_id'],
                    'name': stop_data['name'],
                    'lat': stop_data['lat'],
                    'lon': stop_data['lon'],
                    'distance_to_route': round(stop_data['distance_to_shape'], 3)
                })

        results[line_name] = {
            'color': route_data['color'],
            'stops': stop_list,
            'route_desc': route_data['route_desc']
        }

        if stop_list:
            print(f"  First: {stop_list[0]['name']}")
            print(f"  Last: {stop_list[-1]['name']}")

    return results

# Extract all networks
print("\n" + "="*100)
print("STARTING HYBRID EXTRACTION")
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

# Save results
with open('/Users/juanmaciasgomez/Downloads/complete_hybrid_extraction.json', 'w', encoding='utf-8') as f:
    json.dump(all_results, f, indent=2, ensure_ascii=False)

print("\nResults saved to: complete_hybrid_extraction.json")
