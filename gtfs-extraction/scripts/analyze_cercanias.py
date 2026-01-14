#!/usr/bin/env python3
import csv
from collections import defaultdict

# Load stops
stops = {}
with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/stops.txt', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        stops[row['stop_id'].strip()] = {
            'name': row['stop_name'].strip(),
            'lat': row['stop_lat'].strip(),
            'lon': row['stop_lon'].strip()
        }

# Load trips
trips_by_route = defaultdict(list)
with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/trips.txt', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        if route_id in ['30T0001C1', '30T0002C1', '30T0005C3', '30T0006C3', '30T0009C5', '30T0010C5', '30T0019C5', '30T0020C5']:
            trips_by_route[route_id].append(row['trip_id'].strip())

# Define expected stops for each line
c1_stops = {
    '50600', '50602', '51009', '51003', '51100', '51110', '51113',
    '51111', '51103', '51112', '51200', '51202', '51203',
    '50703', '50704', '50702', '50701', '50700'
}

c3_stops = {
    '51003', '50703', '50704', '50702', '50701', '50700',
    '40122', '40119', '40115', '40113'
}

c5_stops = {
    '43000', '43002', '43026', '43027', '43003', '43004', '43005',
    '51103', '51111', '51113', '51110', '51100', '51003'
}

# Analyze stop sequences for each route
print("=" * 80)
print("ANALYZING SEVILLA CERCANÍAS STOP SEQUENCES")
print("=" * 80)

for route_id in sorted(trips_by_route.keys()):
    print(f"\n{'=' * 80}")
    print(f"ROUTE: {route_id}")
    print(f"Total trips: {len(trips_by_route[route_id])}")
    print(f"{'=' * 80}")

    # Determine which stops to look for
    if 'C1' in route_id:
        expected_stops = c1_stops
        line_name = "C1"
    elif 'C3' in route_id:
        expected_stops = c3_stops
        line_name = "C3"
    elif 'C5' in route_id:
        expected_stops = c5_stops
        line_name = "C5"
    else:
        continue

    # Analyze each trip
    best_trip = None
    best_count = 0
    best_sequence = []

    trip_sequences = {}

    for trip_id in trips_by_route[route_id][:50]:  # Sample first 50 trips
        sequence = []
        with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/stop_times.txt', 'r') as f:
            reader = csv.DictReader(f)
            for row in reader:
                if row['trip_id'].strip() == trip_id:
                    stop_id = row['stop_id'].strip()
                    sequence.append({
                        'stop_id': stop_id,
                        'stop_sequence': int(row['stop_sequence'].strip()),
                        'arrival_time': row['arrival_time'].strip(),
                        'departure_time': row['departure_time'].strip()
                    })

        sequence.sort(key=lambda x: x['stop_sequence'])
        trip_sequences[trip_id] = sequence

        # Count how many expected stops are in this trip
        stop_ids_in_trip = {s['stop_id'] for s in sequence}
        matching_stops = expected_stops & stop_ids_in_trip

        if len(matching_stops) > best_count:
            best_count = len(matching_stops)
            best_trip = trip_id
            best_sequence = sequence

    if best_trip:
        print(f"\nBest trip: {best_trip}")
        print(f"Matching stops: {best_count}/{len(expected_stops)}")
        print(f"\nComplete stop sequence ({len(best_sequence)} stops):")
        print("-" * 80)

        for i, stop in enumerate(best_sequence, 1):
            stop_id = stop['stop_id']
            if stop_id in stops:
                stop_info = stops[stop_id]
                marker = " *** EXPECTED ***" if stop_id in expected_stops else ""
                print(f"{i:2d}. {stop_id:6s} | {stop_info['name']:40s} | {stop_info['lat']:11s}, {stop_info['lon']:11s} | {stop['departure_time']}{marker}")
            else:
                print(f"{i:2d}. {stop_id:6s} | STOP NOT FOUND")

print("\n" + "=" * 80)
print("ANALYSIS COMPLETE")
print("=" * 80)
