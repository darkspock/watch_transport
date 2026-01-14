#!/usr/bin/env python3
import csv
from collections import defaultdict

# Load stops
stops = {}
with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/stops.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        stops[row['stop_id'].strip()] = {
            'name': row['stop_name'].strip(),
            'lat': row['stop_lat'].strip(),
            'lon': row['stop_lon'].strip()
        }

# Load all trips for Madrid C1
target_routes = ['10T0001C1', '10T0002C1']  # Both directions
trips_by_route = defaultdict(list)

with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/trips.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        if route_id in target_routes:
            trips_by_route[route_id].append(row['trip_id'].strip())

# Expected stops for Madrid C1 (based on Renfe website)
c1_expected = {
    '10000': 'Príncipe Pío',
    '10001': 'Aravaca',
    '10002': 'Pozuelo',
    '10010': 'El Barrial-Centro Comercial Pozuelo',
    '10005': 'Las Rozas',
    '10007': 'Majadahonda',
    '11001': 'Nuevos Ministerios',
    '11002': 'Chamartín - Clara Campoamor',
    '11010': 'Recoletos',
    '11030': 'Madrid-Atocha Cercanías',
    '11100': 'Méndez Álvaro',
    '11200': 'Aeropuerto T4'
}

def load_trip_stops(trip_id):
    """Load all stops for a given trip_id"""
    stops_list = []
    with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/stop_times.txt', 'r', encoding='utf-8') as f:
        for line in f:
            if line.startswith(trip_id + ','):
                parts = line.strip().split(',')
                if len(parts) >= 5:
                    stops_list.append({
                        'trip_id': parts[0].strip(),
                        'arrival': parts[1].strip(),
                        'departure': parts[2].strip(),
                        'stop_id': parts[3].strip(),
                        'sequence': int(parts[4].strip())
                    })
    stops_list.sort(key=lambda x: x['sequence'])
    return stops_list

def analyze_route(route_id, expected_stops):
    """Find all unique stop sequences for a route"""
    print(f"\n{'=' * 100}")
    print(f"ROUTE: {route_id}")
    print(f"{'=' * 100}")

    trips = trips_by_route[route_id]
    print(f"Total trips: {len(trips)}")

    # Analyze sample of trips
    best_trip = None
    best_count = 0
    all_unique_sequences = {}

    # Sample trips
    sample_trips = trips[::10] if len(trips) > 100 else trips[:50]

    for trip_id in sample_trips:
        trip_stops = load_trip_stops(trip_id)
        stop_ids_in_trip = {s['stop_id'] for s in trip_stops}
        matching = stop_ids_in_trip & set(expected_stops.keys())

        # Create signature
        signature = ','.join([s['stop_id'] for s in trip_stops])
        if signature not in all_unique_sequences:
            all_unique_sequences[signature] = {
                'trip_id': trip_id,
                'stops': trip_stops,
                'matching_count': len(matching)
            }

        if len(matching) > best_count:
            best_count = len(matching)
            best_trip = trip_id
            best_sequence = trip_stops

    print(f"\nUnique stop sequences found: {len(all_unique_sequences)}")
    print(f"\nBest trip: {best_trip}")
    print(f"Matching expected stops: {best_count}/{len(expected_stops)}")

    # Print ALL unique sequences
    print(f"\n{'=' * 100}")
    print("ALL UNIQUE STOP SEQUENCES:")
    print(f"{'=' * 100}")

    for i, (sig, data) in enumerate(sorted(all_unique_sequences.items(),
                                           key=lambda x: len(x[1]['stops']),
                                           reverse=True), 1):
        print(f"\n--- Sequence {i} (Trip: {data['trip_id']}, {len(data['stops'])} stops, {data['matching_count']} expected) ---")
        for j, stop in enumerate(data['stops'], 1):
            stop_id = stop['stop_id']
            if stop_id in stops:
                stop_info = stops[stop_id]
                marker = " ***" if stop_id in expected_stops else ""
                print(f"  {j:2d}. {stop_id:6s} | {stop_info['name']:45s} | "
                      f"{stop_info['lat']:11s}, {stop_info['lon']:11s} | {stop['departure']}{marker}")

# Analyze Madrid C1
print("=" * 100)
print("MADRID CERCANÍAS - LINE C1")
print("=" * 100)
print("\nColor: #75B6E0 (Light Blue)")
print("Route: Príncipe Pío - Aeropuerto T4")

print("\n\n")
print("#" * 100)
print("### DIRECTION 1: Príncipe Pío → Aeropuerto T4 ###")
print("#" * 100)
analyze_route('10T0001C1', c1_expected)

print("\n\n")
print("#" * 100)
print("### DIRECTION 2: Aeropuerto T4 → Príncipe Pío ###")
print("#" * 100)
analyze_route('10T0002C1', c1_expected)

print("\n\n" + "=" * 100)
print("ANALYSIS COMPLETE")
print("=" * 100)
