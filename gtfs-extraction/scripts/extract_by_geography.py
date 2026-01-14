#!/usr/bin/env python3
"""
Extract complete lines using geographic ordering when stop_times is missing
"""
import csv
import math
from collections import defaultdict

GTFS_PATH = '/Users/juanmaciasgomez/Downloads/20260113_170011_RENFE_CERCA/'

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

def distance(lat1, lon1, lat2, lon2):
    """Calculate distance between two points (Haversine)"""
    R = 6371  # Earth radius in km
    lat1, lon1, lat2, lon2 = map(math.radians, [lat1, lon1, lat2, lon2])
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = math.sin(dlat/2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon/2)**2
    c = 2 * math.asin(math.sqrt(a))
    return R * c

def order_stops_geographically(stop_ids, start_id=None):
    """Order stops by geographic proximity (nearest neighbor)"""
    if not stop_ids:
        return []

    ordered = []
    remaining = set(stop_ids)

    # Start from specified stop or the westernmost/southernmost
    if start_id and start_id in remaining:
        current = start_id
    else:
        # Start from southernmost stop
        current = min(remaining, key=lambda s: stops[s]['lat'] if s in stops else 999)

    ordered.append(current)
    remaining.remove(current)

    # Nearest neighbor algorithm
    while remaining:
        if current not in stops:
            current = remaining.pop()
            ordered.append(current)
            continue

        curr_lat = stops[current]['lat']
        curr_lon = stops[current]['lon']

        nearest = min(remaining, key=lambda s: distance(curr_lat, curr_lon, stops[s]['lat'], stops[s]['lon']) if s in stops else 999)
        ordered.append(nearest)
        remaining.remove(nearest)
        current = nearest

    return ordered

# MADRID C1: We know the exact sequence from Wikipedia
madrid_c1_stops = ['98305', '98304', '98003', '17000']

# MADRID - Other lines need geographic ordering based on known terminals
# Let me extract based on routes.txt descriptions and coordinate regions

print("="*100)
print("MADRID C1 (from Wikipedia + GTFS)")
print("="*100)
for stop_id in madrid_c1_stops:
    if stop_id in stops:
        s = stops[stop_id]
        print(f"  {stop_id} | {s['name']:45s} | {s['lat']:.6f}, {s['lon']:.6f}")

# For other networks, let me identify stops by coordinate ranges
# Madrid area: lat 40.3-40.7, lon -4.0 to -3.5
madrid_stops = [sid for sid, s in stops.items() if 40.2 < s['lat'] < 40.8 and -4.1 < s['lon'] < -3.4]
print(f"\nTotal Madrid-area stops: {len(madrid_stops)}")

# Valencia area: lat 38.8-40.0, lon -1.3 to -0.2
valencia_stops = [sid for sid, s in stops.items() if 38.7 < s['lat'] < 40.1 and -1.4 < s['lon'] < -0.1]
print(f"Total Valencia-area stops: {len(valencia_stops)}")

# Barcelona area: lat 41.0-42.5, lon 1.2-2.7
barcelona_stops = [sid for sid, s in stops.items() if 40.9 < s['lat'] < 42.6 and 1.0 < s['lon'] < 2.8]
print(f"Total Barcelona-area stops: {len(barcelona_stops)}")

# Málaga area: lat 36.5-36.9, lon -4.8 to -4.3
malaga_stops = [sid for sid, s in stops.items() if 36.4 < s['lat'] < 37.0 and -4.9 < s['lon'] < -4.2]
print(f"Total Málaga-area stops: {len(malaga_stops)}")

# Bilbao area: lat 42.9-43.4, lon -3.2 to -1.8
bilbao_stops = [sid for sid, s in stops.items() if 42.8 < s['lat'] < 43.5 and -3.3 < s['lon'] < -1.7]
print(f"Total Bilbao-area stops: {len(bilbao_stops)}")

print("\nNote: Geographic approach has limitations.")
print("Recommendation: Use network-specific GTFS files from data.renfe.com for each city")
print("Or use the real-time GTFS-RT feed to observe actual trips and extract routes from there")
