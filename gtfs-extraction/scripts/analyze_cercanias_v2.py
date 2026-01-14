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

# Load all trips for target routes
target_routes = ['30T0001C1', '30T0002C1', '30T0005C3', '30T0006C3', '30T0009C5', '30T0010C5', '30T0019C5', '30T0020C5']
trips_by_route = defaultdict(list)

with open('/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/trips.txt', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        route_id = row['route_id'].strip()
        if route_id in target_routes:
            trips_by_route[route_id].append(row['trip_id'].strip())

# Define expected stops for each line
c1_expected = {
    '50600': 'Lora Del Río',
    '50602': 'Guadajoz',
    '51009': 'Palacio de Congresos',
    '51003': 'Santa Justa',
    '51100': 'San Bernardo',
    '51110': 'Virgen del Rocío',
    '51113': 'Jardines de Hércules',
    '51111': 'Bellavista',
    '51103': 'Dos Hermanas',
    '51112': 'Cantaelgallo',
    '51200': 'Utrera',
    '51202': 'Las Cabezas de San Juan',
    '51203': 'Lebrija',
    '50703': 'La Rinconada',
    '50704': 'El Cáñamo',
    '50702': 'Brenes',
    '50701': 'Cantillana',
    '50700': 'Los Rosales'
}

c3_expected = {
    '51003': 'Santa Justa',
    '50703': 'La Rinconada',
    '50704': 'El Cáñamo',
    '50702': 'Brenes',
    '50701': 'Cantillana',
    '50700': 'Los Rosales',
    '40122': 'Tocina',
    '40119': 'Villanueva del Río-Minas',
    '40115': 'Pedroso',
    '40113': 'Cazalla-Constantina'
}

c5_expected = {
    '43000': 'San Jerónimo',
    '43002': 'Camas',
    '43026': 'Valencina-Santiponce',
    '43027': 'Salteras',
    '43003': 'Villanueva Del Ariscal',
    '43004': 'Sanlúcar La Mayor',
    '43005': 'Benacazón',
    '51103': 'Dos Hermanas',
    '51111': 'Bellavista',
    '51113': 'Jardines de Hércules',
    '51110': 'Virgen del Rocío',
    '51100': 'San Bernardo',
    '51003': 'Santa Justa'
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
    """Find the trip with most expected stops for a route"""
    print(f"\n{'=' * 100}")
    print(f"ROUTE: {route_id}")
    print(f"{'=' * 100}")

    trips = trips_by_route[route_id]
    print(f"Total trips: {len(trips)}")

    # Analyze a sample of trips to find patterns
    best_trip = None
    best_count = 0
    best_sequence = []
    all_unique_sequences = {}

    # Sample every 10th trip to cover different service patterns
    sample_trips = trips[::10] if len(trips) > 100 else trips[:50]

    for trip_id in sample_trips:
        trip_stops = load_trip_stops(trip_id)
        stop_ids_in_trip = {s['stop_id'] for s in trip_stops}
        matching = stop_ids_in_trip & set(expected_stops.keys())

        # Create a signature for this sequence
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

# Analyze each line
print("=" * 100)
print("SEVILLA CERCANÍAS - COMPLETE STOP SEQUENCES")
print("=" * 100)

print("\n\n")
print("#" * 100)
print("### LINE C1 - LORA DEL RÍO / LEBRIJA ###")
print("#" * 100)
analyze_route('30T0001C1', c1_expected)
analyze_route('30T0002C1', c1_expected)

print("\n\n")
print("#" * 100)
print("### LINE C3 - SANTA JUSTA / CAZALLA-CONSTANTINA ###")
print("#" * 100)
analyze_route('30T0005C3', c3_expected)
analyze_route('30T0006C3', c3_expected)

print("\n\n")
print("#" * 100)
print("### LINE C5 - BENACAZÓN / VALENCINA-SANTIPONCE / DOS HERMANAS ###")
print("#" * 100)
analyze_route('30T0009C5', c5_expected)
analyze_route('30T0010C5', c5_expected)
analyze_route('30T0019C5', c5_expected)
analyze_route('30T0020C5', c5_expected)

print("\n\n" + "=" * 100)
print("ANALYSIS COMPLETE")
print("=" * 100)
